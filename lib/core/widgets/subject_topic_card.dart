import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class SubjectTopicCard extends StatelessWidget {
  const SubjectTopicCard({
    required this.title,
    required this.subtitle,
    required this.cardColors,
    this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final SubjectPalette cardColors;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    final isDark = theme.brightness == Brightness.dark;

    final cardStart = Color.lerp(
      customColors.subjectCardBackground,
      cardColors.start,
      isDark ? 0.22 : 0.12,
    )!;
    final cardEnd = Color.lerp(
      customColors.subjectCardBackground,
      cardColors.end,
      isDark ? 0.16 : 0.08,
    )!;
    final borderColor = Color.lerp(
      customColors.subjectCardBorder,
      cardColors.end,
      isDark ? 0.5 : 0.28,
    )!;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Ink(
        width: double.infinity,
        height: 124,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [cardStart, cardEnd],
          ),
          border: Border.all(color: borderColor.withOpacity(isDark ? 0.72 : 0.94)),
          boxShadow: [
            BoxShadow(
              color: cardColors.shadow.withOpacity(isDark ? 0.2 : 0.1),
              blurRadius: isDark ? 14 : 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              _AccentPanel(start: cardColors.start, end: cardColors.end),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 38,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.2,
                          fontWeight: FontWeight.w800,
                          color: customColors.subjectCardTitle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      height: 34,
                      child: Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.5,
                          height: 1.28,
                          fontWeight: FontWeight.w500,
                          color: customColors.subjectCardDescription,
                        ),
                      ),
                    ),
                    const Spacer(),
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

class _AccentPanel extends StatelessWidget {
  const _AccentPanel({
    required this.start,
    required this.end,
  });

  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [start.withOpacity(0.92), end.withOpacity(0.92)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 8,
            child: _dot(10, Colors.white.withOpacity(0.95)),
          ),
          Positioned(
            top: 24,
            left: 14,
            child: Container(
              width: 2,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 8,
            child: _dot(12, Colors.white.withOpacity(0.9)),
          ),
        ],
      ),
    );
  }

  Widget _dot(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
