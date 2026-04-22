import 'package:elearn_mobile/app/routes/route_names.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:elearn_mobile/core/widgets/subject_topic_card.dart';
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
    final cardColors = _cardColorsFor(colors, section.type);

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
              final topic = section.topics[index];
              return FractionallySizedBox(
                widthFactor: 0.76,
                child: SubjectTopicCard(
                  symbol: topic.symbol,
                  title: topic.title,
                  cardColors: cardColors,
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed(RouteNames.topicDetail, arguments: topic);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  SubjectPalette _cardColorsFor(AppCustomColors colors, SubjectType type) {
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
