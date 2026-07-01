import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import '../../../core/utils/constants.dart';
import '../../../core/utils/screen_helper.dart';
import '../../../widgets/expertise_card.dart';

class ServiceSection extends StatelessWidget {
  ServiceSection({Key? key}) : super(key: key);
  final expertise = [

    Expertise(
      icon: Icons.phone_android_rounded,
      accent: Colors.green,
      title: "Mobile Engineering",
      description:
      "Building high-performance Android, Flutter and iOS applications with a focus on scalability, reliability and delightful user experiences.",
      skills: [
        "Kotlin",
        "Flutter",
        "SwiftUI",
      ],
      leftStat: "6+ Years",
      rightStat: "800K+ Downloads",
    ),

    Expertise(
      icon: Icons.storage_rounded,
      accent: Colors.blue,
      title: "Backend Systems",
      description:
      "Designing APIs, authentication systems, AI services and distributed backend infrastructure.",
      skills: [
        "Kotlin",
        "Node.js",
        "Python",
      ],
      leftStat: "3+ Years",
      rightStat: "2 Libraries",
    ),

    Expertise(
      icon: Icons.auto_awesome,
      accent: Colors.deepPurple,
      title: "AI Engineering",
      description:
      "Integrating LLMs, AI assistants and intelligent automation into production mobile and backend applications.",
      skills: [
        "Prompting",
        "RAG",
        "Agents",
      ],
      leftStat: "2+ Years",
      rightStat: "5+ Features",
    ),

  ];

  void _downloadCV() {
    final filename = 'Damian_Tochukwu_CV.pdf';
    html.AnchorElement(href: AppConstants.resumeDownloadUrl)
      ..setAttribute('download', filename)
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenHelper.isDesktop(context) ? 70 : 30,
        ),
        Text(
          "Engineering Focus",
          style: GoogleFonts.josefinSans(
            fontWeight: FontWeight.w900,
            height: 1.3,
            fontSize: 35.0,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Performance, simplicity, and thoughtful engineering.",
          style: GoogleFonts.josefinSans(
            color: Colors.grey[400],
            fontSize: 14.0,
          ),
        ),
        SizedBox(
          height: ScreenHelper.isDesktop(context) ? 60 : 20,
        ),
        Consumer(
          builder: (context, ref, _) {
            return Wrap(
              spacing: 30,
              runSpacing: 30,
              children:
              expertise
                  .map((e)=>ExpertiseCard(expertise: e,))
                  .toList(),
            );
          },
        ),
        SizedBox(
          height: ScreenHelper.isDesktop(context) ? 50 : 20,
        ),
        GestureDetector(
          onTap: _downloadCV,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              "DOWNLOAD CV",
              style: GoogleFonts.josefinSans(
                color: kPrimaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 80.0,
        ),
      ],
    );
  }
}


class StatItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const StatItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}


class Expertise {
  final IconData icon;
  final String title;
  final String description;
  final List<String> skills;
  final String leftStat;
  final String rightStat;
  final Color accent;

  const Expertise({
    required this.icon,
    required this.title,
    required this.description,
    required this.skills,
    required this.leftStat,
    required this.rightStat,
    required this.accent,
  });
}

class SkillChip extends StatelessWidget {
  final String text;

  const SkillChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white.withOpacity(.05),
        border: Border.all(
          color: Colors.white.withOpacity(.08),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}