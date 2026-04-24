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
    final borderRadius = BorderRadius.circular(22);

    final cardBase = Color.lerp(
      customColors.subjectCardBackground,
      Colors.black,
      isDark ? 0.12 : 0.04,
    )!;
    final cardStart = Color.lerp(
      cardBase,
      cardColors.start,
      isDark ? 0.1 : 0.06,
    )!;
    final cardEnd = Color.lerp(
      cardBase,
      cardColors.end,
      isDark ? 0.06 : 0.04,
    )!;
    final accentColor = Color.lerp(cardColors.start, cardColors.end, 0.5)!;
    final borderColor =
        Color.lerp(cardColors.start, cardColors.end, isDark ? 0.62 : 0.48)!;

    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth.isFinite
              ? constraints.maxWidth
              : MediaQuery.sizeOf(context).width;
          final cardHeight = availableWidth < 360 ? 132.0 : 140.0;
          final imageZoneWidth =
              (availableWidth * 0.34).clamp(96.0, 126.0).toDouble();
          final imageWidth = (imageZoneWidth * 0.92).clamp(88.0, 116.0).toDouble();
          final titleFontSize = availableWidth < 360 ? 15.5 : 16.5;

          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: onTap,
              child: Ink(
                width: double.infinity,
                height: cardHeight,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [cardBase, cardStart, cardEnd],
                    stops: const [0, 0.64, 1],
                  ),
                  border: Border.all(
                    color: borderColor.withOpacity(isDark ? 0.9 : 0.72),
                    width: 1.2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: IgnorePointer(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(isDark ? 0.018 : 0.05),
                                  Colors.transparent,
                                  cardColors.shadow.withOpacity(isDark ? 0.02 : 0.01),
                                ],
                                stops: const [0, 0.45, 1],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: -availableWidth * 0.04,
                        top: -cardHeight * 0.08,
                        child: IgnorePointer(
                          child: Container(
                            width: imageWidth * 1.35,
                            height: cardHeight * 0.9,
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                center: const Alignment(-0.15, 0),
                                radius: 0.88,
                                colors: [
                                  cardColors.shadow.withOpacity(isDark ? 0.1 : 0.05),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 18, 16, 18),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: titleFontSize,
                                        fontWeight: FontWeight.w800,
                                        height: 1.18,
                                        color: customColors.subjectCardTitle,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      width: 46,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: accentColor,
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      subtitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w500,
                                        height: 1.35,
                                        color: customColors.subjectCardDescription,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: imageZoneWidth,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Opacity(
                                  opacity: 0.94,
                                  child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.contain,
                                    width: imageWidth,
                                  ),
                                ),
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
        },
      ),
    );
  }
}
