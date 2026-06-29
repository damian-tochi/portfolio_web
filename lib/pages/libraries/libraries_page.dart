import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:my_portfolio/core/utils/utils.dart';

import '../../widgets/header.dart';
import '../home/components/footer.dart';

class LibrariesPage extends ConsumerStatefulWidget {
  const LibrariesPage({super.key});

  @override
  ConsumerState<LibrariesPage> createState() => _LibrariesPageState();
}

class _LibrariesPageState extends ConsumerState<LibrariesPage> {
  late final List<ProjectModel> _libraryProjects;

  @override
  void initState() {
    super.initState();
    _libraryProjects = ProjectModel.libraries.toList();
  }

  Widget _buildPage() {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenHelper.isDesktop(context) ? 30 : 20,
                ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      "My Libraries",
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "My Libraries mostly opensource",
                      style: GoogleFonts.josefinSans(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                )),
                ScreenHelper(
                  desktop: _buildUi(context),
                  tablet: _buildUi(context),
                  mobile: _buildUi(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Footer()
              ],
            ),
          ),
        ),
        const CommonHeader(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
    );
  }

  Widget _buildUi(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    int crossAxisCount;
    double childAspectRatio;

    if (width >= 1400) {
      crossAxisCount = 4;
      childAspectRatio = 0.9;
    } else if (width >= 900) {
      crossAxisCount = 3;
      childAspectRatio = 0.85;
    } else {
      crossAxisCount = 1;
      childAspectRatio = 0.78;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      itemCount: _libraryProjects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (_, index) => _buildLibraryCard(_libraryProjects[index]),
    );
  }

  Widget _buildLibraryCard(ProjectModel project) {
    return Consumer(
      builder: (context, ref, _) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ref.watch(themeProvider).isDarkMode
                ? const Color.fromARGB(75, 12, 12, 7)
                : Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: ref.watch(themeProvider).isDarkMode
                    ? Colors.black26
                    : Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (project.appPhotos != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      project.appPhotos!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              Text(
                project.project,
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                project.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                project.description,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: kCaptionColor,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              if (project.buttonText != null)
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => Utilty.openUrl(project.projectLink),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      project.buttonText!.toUpperCase(),
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
