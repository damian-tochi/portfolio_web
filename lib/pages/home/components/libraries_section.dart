import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/core/utils/utils.dart';
import 'package:my_portfolio/models/project.dart';

import '../../../provider/theme.dart';

class LibrariesSection extends StatefulWidget {
  const LibrariesSection({
    super.key,
    required this.projects,
  });

  final List<ProjectModel> projects;

  @override
  State<LibrariesSection> createState() => _LibrariesSectionState();
}

class _LibrariesSectionState extends State<LibrariesSection> {
  final ScrollController _scrollController = ScrollController();

  bool _canScrollLeft = false;
  bool _canScrollRight = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_updateButtons);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateButtons();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateButtons);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateButtons() {
    if (!_scrollController.hasClients) return;

    setState(() {
      _canScrollLeft = _scrollController.offset > 0;

      _canScrollRight =
          _scrollController.offset < _scrollController.position.maxScrollExtent;
    });
  }

  void _scroll(bool forward) {
    if (!_scrollController.hasClients) return;

    final target = (_scrollController.offset + (forward ? 350 : -350)).clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );

    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {

    return SizedBox(
      height: 430,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 430,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.projects
                        .map(
                          (project) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 15,
                            ),
                            child: SizedBox(
                              width: 300,
                              child: _LibraryCard(project: project),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),

          /// LEFT BUTTON
          Positioned(
            left: 10,
            child: AnimatedOpacity(
              opacity: _canScrollLeft ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: IgnorePointer(
                ignoring: !_canScrollLeft,
                child: _ScrollButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () => _scroll(false),
                ),
              ),
            ),
          ),

          /// RIGHT BUTTON
          Positioned(
            right: 10,
            child: AnimatedOpacity(
              opacity: _canScrollRight ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: IgnorePointer(
                ignoring: !_canScrollRight,
                child: _ScrollButton(
                  icon: Icons.arrow_forward_ios_rounded,
                  onTap: () => _scroll(true),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScrollButton extends StatelessWidget {
  const _ScrollButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: Colors.yellow,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: SizedBox(
          width: 48,
          height: 48,
          child: Icon(
            icon,
            color: Colors.black87,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class _LibraryCard extends ConsumerWidget {
  const _LibraryCard({
    required this.project,
  });

  final ProjectModel project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider).isDarkMode;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color.fromARGB(75, 12, 12, 7) : Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.grey.withOpacity(.1),
            blurRadius: 8,
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
          const SizedBox(height: 12),
          Text(
            project.project,
            textAlign: TextAlign.center,
            style: GoogleFonts.josefinSans(
              color: kPrimaryColor,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            project.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w800,
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
          const Spacer(),
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
  }
}
