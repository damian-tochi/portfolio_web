import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/technology.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/screen_helper.dart';

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
          return Flex(
            direction:
            constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "About Me",
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        height: 1.3,
                        fontSize: 35.0,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "I'm Damian Tochukwu, a native Android and iOS developer with expertise in cross-platform mobile development using Flutter. I also have strong experience in frontend and backend engineering, working with frameworks such as NestJS, Java, Python, and Flask. In addition, I'm passionate about Natural Language Processing (NLP) and continually explore its applications and advancements.",
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "I'm a Computer Science MSc student at FUTO, currently working on my research. I've been developing mobile apps for over 6 years, with several live on the Play Store and App Store. I've worked with a few organizations and also enjoy building side projects in my spare time—mostly just for fun or personal growth. I'm always curious about new tech and love being in environments that encourage learning, creativity, and meaningful impact.",
                      style: TextStyle(
                        color: kCaptionColor,
                        height: 1.5,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Technology I have worked with",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Consumer(builder: (context, ref, _) {
                      return ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: TechnologyConstants.technologyLearned
                                .map((e) => MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ref
                                      .watch(themeProvider)
                                      .isDarkMode
                                      ? Colors.grey[800]
                                      : Colors.grey[200],
                                  borderRadius:
                                  BorderRadius.circular(4.0),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 6),
                                child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: Image.asset(e.logo)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          e.name,
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))
                                .toList(),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 70.0,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxWidth / 15,
              ),
              if (ScreenHelper.isDesktop(context) ||
                  ScreenHelper.isTablet(context))
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.asset(
                      AppConstants.person,
                      width: constraints.maxWidth > 980.0 ? null : 550.0,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    ),);
  }
}
