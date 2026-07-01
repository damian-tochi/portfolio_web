import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/provider/theme.dart';

import '../pages/home/components/service.dart';


class ExpertiseCard extends ConsumerStatefulWidget {
  final Expertise expertise;

  const ExpertiseCard({
    super.key,
    required this.expertise,
  });

  @override
  ConsumerState<ExpertiseCard> createState() => _ExpertiseCardState();
}

class _ExpertiseCardState extends ConsumerState<ExpertiseCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final dark = ref.watch(themeProvider).isDarkMode;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        transform: Matrix4.identity()
          ..translate(
            0.0,
            _hovered ? -8.0 : 0.0,
          ),
        width: 360,
        height: 500,  // ← ADD THIS LINE
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: dark
              ? const Color(0xff111111)
              : Colors.white,
          border: Border.all(
            color: _hovered
                ? widget.expertise.accent
                : (dark
                ? Colors.white10
                : Colors.grey.shade300),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: _hovered
                  ? widget.expertise.accent.withOpacity(.20)
                  : Colors.black.withOpacity(.06),
              blurRadius: _hovered ? 30 : 12,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: widget.expertise.accent.withOpacity(.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                widget.expertise.icon,
                size: 34,
                color: widget.expertise.accent,
              ),
            ),

            const SizedBox(height: 24),

            Text(
              widget.expertise.title,
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),

            const SizedBox(height: 14),

            Text(
              widget.expertise.description,
              style: GoogleFonts.josefinSans(
                fontSize: 15,
                height: 1.7,
                color: dark
                    ? Colors.grey.shade400
                    : Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 26),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.expertise.skills
                  .map(
                    (e) => SkillChip(text: e),
              )
                  .toList(),
            ),

            const SizedBox(height: 28),

            Divider(
              color: dark
                  ? Colors.white10
                  : Colors.grey.shade300,
            ),

            const SizedBox(height: 18),

            Row(
              children: [

                Expanded(
                  child: _Stat(
                    title: widget.expertise.leftStat,
                    subtitle: "Experience",
                  ),
                ),

                Expanded(
                  child: _Stat(
                    title: widget.expertise.rightStat,
                    subtitle: "Impact",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String title;
  final String subtitle;

  const _Stat({
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
          style: GoogleFonts.josefinSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          subtitle,
          style: GoogleFonts.josefinSans(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}