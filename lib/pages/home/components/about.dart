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
                  "I'm Damian Tochukwu, a Software Engineer building scalable, high-performance products across mobile and backend systems. I specialize in Android (Kotlin/Java), Flutter, iOS (SwiftUI), and modern backend technologies, with a strong focus on AI-powered experiences, offline-first architecture, and reliable distributed systems.",
                  style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Over the last 7+ years, I've shipped production software reaching 800K+ downloads across fintech, education, media, and enterprise products. From architecting offline-first mobile systems to integrating LLMs and leading cross-platform engineering efforts, I enjoy solving difficult technical problems while building products that scale. I'm equally comfortable writing production code, shaping system architecture, mentoring engineers, and turning ambitious ideas into reliable software.",
                  style: TextStyle(
                    color: kCaptionColor,
                    height: 1.6,
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
