import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/technology.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';

import '../../../widgets/cached_image.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 1900),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktopLayout = constraints.maxWidth > 720;

            final aboutContent = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),

                Text(
                  "About Me",
                  style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                    fontSize: 35,
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  "I'm Damian Tochukwu, a Software Engineer specializing in mobile platforms. I design and build high-performance Android, iOS, and Flutter applications with a strong emphasis on scalable architecture, performance, and developer experience. I also enjoy building backend systems and integrating AI-powered experiences into modern mobile applications.",
                  style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Over the past 7+ years, I've delivered production software across fintech, media, logistics, and enterprise products, with applications published on both the Play Store and App Store. My work spans native Android, SwiftUI, Flutter, Kotlin Multiplatform, backend development, and AI integration—from modular mobile architectures to intelligent features powered by Large Language Models. I'm currently pursuing an MSc in Computer Science at the Federal University of Technology Owerri (FUTO), where my research explores AI-driven agricultural product enhancement. Outside of work, you'll usually find me building side projects, experimenting with emerging technologies, or refining developer workflows.",
                  style: TextStyle(
                    color: kCaptionColor,
                    height: 1.5,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Technology I have worked with",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Consumer(
                  builder: (context, ref, _) {
                    return ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: TechnologyConstants.technologyLearned
                              .map(
                                (e) => Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 5),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: ref.watch(themeProvider).isDarkMode
                                    ? Colors.grey[800]
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(e.logo),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    e.name,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                              .toList(),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 70),
              ],
            );

            final profileImage = ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: CachedImage(
                imageUrl: AppConstants.person,
                radius: constraints.maxWidth / 8,
                fit: BoxFit.fill,
              ),
            );

            if (isDesktopLayout) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: aboutContent,
                  ),
                  SizedBox(width: constraints.maxWidth / 15),
                  Expanded(
                    flex: 1,
                    child: profileImage,
                  ),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                aboutContent,
              ],
            );
          },
        ),
      ),
    );
  }
}
