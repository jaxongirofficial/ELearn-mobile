import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:elearn_mobile/core/theme/app_fonts.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class SubjectTopicCard extends StatelessWidget {
  const SubjectTopicCard({
    required this.symbol,
    required this.title,
    required this.palette,
    this.onTap,
    super.key,
  });

  final String symbol;
  final String title;
  final SubjectPalette palette;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;
    final isDark = theme.brightness == Brightness.dark;
    final borderRadius = BorderRadius.circular(18);
    final cardStart =
        Color.lerp(
          palette.start,
          colors.subjectCardBackground,
          isDark ? 0.16 : 0.28,
        )!;
    final cardEnd =
        Color.lerp(
          palette.end,
          colors.subjectCardBackground,
          isDark ? 0.08 : 0.16,
        )!;
    final borderColor =
        Color.lerp(palette.end, colors.subjectCardBorder, isDark ? 0.35 : 0.55)!;
    final symbolColor =
        Color.lerp(palette.foreground, AppColors.white, isDark ? 0.08 : 0.18)!;

    return InkWell(
      borderRadius: borderRadius,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [cardStart, cardEnd],
                ),
                border: Border.all(
                  color: borderColor.withOpacity(isDark ? 0.78 : 0.95),
                  width: 1.05,
                ),
                boxShadow: [
                  BoxShadow(
                    color: palette.shadow.withOpacity(isDark ? 0.24 : 0.12),
                    blurRadius: isDark ? 16 : 12,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      symbol,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: AppFonts.primary,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 0.05,
                        color: symbolColor.withOpacity(isDark ? 0.94 : 0.9),
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(isDark ? 0.22 : 0.14),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 46,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11.5,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                  color: colors.subjectCardTitle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
