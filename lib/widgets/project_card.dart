import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/provider/theme.dart';
import 'package:my_portfolio/core/utils/constants.dart';
import 'package:my_portfolio/core/utils/utils.dart';

class ProjectCard extends ConsumerStatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });

  final ProjectModel project;

  @override
  ConsumerState<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends ConsumerState<ProjectCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final dark = ref.watch(themeProvider).isDarkMode;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: 410,
        margin: const EdgeInsets.all(16),
        transform: Matrix4.identity()
          ..translate(
            0.0,
            hovered ? -8 : 0,
          ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: dark
              ? const Color(0xff101114)
              : Colors.white,
          border: Border.all(
            color: hovered
                ? kPrimaryColor.withOpacity(.45)
                : dark
                ? Colors.white10
                : Colors.grey.shade300,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: hovered ? 35 : 14,
              spreadRadius: hovered ? 1 : 0,
              offset: const Offset(0, 16),
              color: hovered
                  ? kPrimaryColor.withOpacity(.15)
                  : Colors.black.withOpacity(.06),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              if (widget.project.appPhotos != null)
                SizedBox(
                  height: 280,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [

                      AnimatedScale(
                        scale: hovered ? 1.04 : 1,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          widget.project.appPhotos!,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(.75),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        left: 24,
                        bottom: 22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              widget.project.project.toUpperCase(),
                              style: GoogleFonts.josefinSans(
                                color: Colors.white70,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              widget.project.title,
                              style: GoogleFonts.josefinSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


              Padding(
                padding: const EdgeInsets.all(26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      widget.project.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        height: 1.7,
                        color: dark
                            ? Colors.grey.shade400
                            : Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: widget.project.techUsed.map((tech) {
                        return _Chip(
                          label: tech.name,
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 28),

                    Row(
                      children: [

                        Expanded(
                          child: _Metric(
                            value: "Production",
                            label: "Status",
                          ),
                        ),

                        Expanded(
                          child: _Metric(
                            value: widget.project.techUsed.length.toString(),
                            label: "Technologies",
                          ),
                        ),

                        Expanded(
                          child: _Metric(
                            value: "2025",
                            label: "Updated",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Row(
                      children: [

                        if (widget.project.projectLink.isNotEmpty)
                          _LinkButton(
                            title: widget.project.buttonText ??
                                "View Project",
                            onTap: () {
                              Utilty.openUrl(
                                widget.project.projectLink,
                              );
                            },
                          ),

                        const Spacer(),

                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: hovered
                                ? kPrimaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: hovered
                                  ? kPrimaryColor
                                  : Colors.grey.shade500,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                            color: hovered
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          value,
          style: GoogleFonts.josefinSans(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          label,
          style: GoogleFonts.inter(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: kPrimaryColor.withOpacity(.12),
          border: Border.all(
            color: kPrimaryColor.withOpacity(.4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text(
              title,
              style: GoogleFonts.inter(
                color: kPrimaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(width: 8),

            const Icon(
              Icons.open_in_new_rounded,
              size: 17,
              color: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}