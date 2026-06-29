import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';
import 'package:my_portfolio/core/utils/utils.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/provider/theme.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({
    super.key,
    required this.projects,
  });

  final List<ProjectModel> projects;

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
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
    final height = ScreenHelper.isMobile(context)
        ? 760.0
        : 560.0;

    return SizedBox(
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: height,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: widget.projects
                    .map(
                      (project) => Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: _buildProject(width, project),
                  ),
                )
                    .toList(),
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

  Widget _buildProject(double width, ProjectModel projectModel) {
    return SizedBox(
      width: width,
      child: Consumer(
        builder: (context, ref, _) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ref.watch(themeProvider).isDarkMode
                  ? const Color.fromARGB(75, 12, 12, 7)
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                if (projectModel.appPhotos != null)
                  SizedBox(
                    width: ScreenHelper.isMobile(context)
                        ? width * .9
                        : width * .46,
                    child: Image.asset(
                      projectModel.appPhotos!,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(width: 20, height: 20),
                SizedBox(
                  width:
                      ScreenHelper.isMobile(context) ? width * .9 : width * .45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projectModel.project,
                        style: GoogleFonts.josefinSans(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        projectModel.title,
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w900,
                          fontSize: 28,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        projectModel.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: kCaptionColor,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (projectModel.techUsed.isNotEmpty)
                        Text(
                          "Technologies Used",
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                      Wrap(
                        children: projectModel.techUsed
                            .map(
                              (tech) => Container(
                                margin: const EdgeInsets.all(10),
                                width: 25,
                                height: 25,
                                color: tech.logo == AppConstants.razorPayImage
                                    ? Colors.white
                                    : null,
                                child: Image.asset(tech.logo),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 25),
                      if (projectModel.buttonText != null)
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(kPrimaryColor),
                            ),
                            onPressed: () {
                              if (projectModel.internalLink) {
                                context.goNamed(projectModel.projectLink);
                              } else {
                                Utilty.openUrl(projectModel.projectLink);
                              }
                            },
                            child: Text(
                              projectModel.buttonText!.toUpperCase(),
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
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
