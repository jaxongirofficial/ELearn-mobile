import 'package:elearn_mobile/app/routes/route_names.dart';
import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:elearn_mobile/core/theme/app_fonts.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:elearn_mobile/features/home/data/local/subject_sections_data.dart';
import 'package:elearn_mobile/features/home/domain/entities/subject_catalog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.colorScheme.background;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        itemCount: subjectSections.length,
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return RepaintBoundary(
            child: _SubjectSectionBlock(section: subjectSections[index]),
          );
        },
      ),
    );
  }
}

class _SubjectSectionBlock extends StatelessWidget {
  const _SubjectSectionBlock({required this.section});

  static const _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 6,
    mainAxisSpacing: 6,
    childAspectRatio: 0.72,
  );

  final SubjectSection section;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 18),
          child: Text(
            section.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: colors.subjectCardTitle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: section.topics.length,
            gridDelegate: _gridDelegate,
            itemBuilder: (context, index) {
              return FractionallySizedBox(
                widthFactor: 0.76,
                child: _SubjectGridCard(
                  section: section,
                  topic: section.topics[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SubjectGridCard extends StatelessWidget {
  const _SubjectGridCard({required this.section, required this.topic});

  final SubjectSection section;
  final SubjectTopic topic;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;
    final isDark = theme.brightness == Brightness.dark;
    final borderRadius = BorderRadius.circular(18);
    final palette = _paletteFor(colors, section.type);
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
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(RouteNames.topicDetail, arguments: topic);
      },
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 3,
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      topic.symbol,
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
                            color: Colors.black.withOpacity(
                              isDark ? 0.22 : 0.14,
                            ),
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
                topic.title,
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

  SubjectPalette _paletteFor(AppCustomColors colors, SubjectType type) {
    switch (type) {
      case SubjectType.mathematics:
        return colors.mathematicsPalette;
      case SubjectType.physics:
        return colors.physicsPalette;
      case SubjectType.chemistry:
        return colors.chemistryPalette;
      case SubjectType.biology:
        return colors.biologyPalette;
    }
  }
}
