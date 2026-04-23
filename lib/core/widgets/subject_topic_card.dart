import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class SubjectTopicCard extends StatelessWidget {
  const SubjectTopicCard({
    required this.title,
    required this.subtitle,
    required this.cardColors,
    required this.imagePath,
    this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final SubjectPalette cardColors;
  final String imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    final isDark = theme.brightness == Brightness.dark;
    final borderRadius = BorderRadius.circular(20);

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

    return RepaintBoundary(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Ink(
            height: 124,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [cardStart, cardEnd],
              ),
              border: Border.all(
                color: borderColor.withOpacity(isDark ? 0.72 : 0.94),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: -2,
                  top: 12,
                  bottom: 12,
                  child: Container(
                    width: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [cardColors.start, cardColors.end],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  right: 8,
                  bottom: -10,
                  top: -10,
                  child: Opacity(
                    opacity: 0.9,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      width: 100,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 120, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: customColors.subjectCardTitle,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          color: customColors.subjectCardDescription,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
