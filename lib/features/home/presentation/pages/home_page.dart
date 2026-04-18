import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:elearn_mobile/features/home/presentation/models/subject_catalog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<SubjectSection> _sections = [
    SubjectSection(
      type: SubjectType.mathematics,
      title: 'Mathematics',
      icon: Icons.calculate_rounded,
      topics: [
        SubjectTopic(title: 'Sonlar va arifmetika asoslari'),
        SubjectTopic(title: 'Algebraik ifodalar va formulalar'),
        SubjectTopic(title: 'Tenglamalar va tengsizliklar (boshlang‘ich)'),
        SubjectTopic(title: 'Funksiya va grafiklar'),
        SubjectTopic(title: 'Darajalar va ildizlar'),
        SubjectTopic(title: 'Kvadrat tenglamalar va teoremalar'),
        SubjectTopic(title: 'Murakkab tenglamalar va ifodalar'),
        SubjectTopic(title: 'Logarifmlar va ko‘rsatkichli tenglamalar'),
        SubjectTopic(title: 'Progressiyalar'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.colorScheme.background;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Subjects'),
        centerTitle: true,
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: _sections.length,
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return _SubjectSectionBlock(section: _sections[index]);
        },
      ),
    );
  }
}

class _SubjectSectionBlock extends StatelessWidget {
  const _SubjectSectionBlock({required this.section});

  final SubjectSection section;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 12),
          child: Text(
            section.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: colors.subjectCardTitle,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: section.topics.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.84,
          ),
          itemBuilder: (context, index) {
            return _SubjectGridCard(
              section: section,
              topic: section.topics[index],
            );
          },
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
    final palette = _paletteFor(colors, section.type);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  palette.start.withOpacity(isDark ? 0.68 : 0.76),
                  palette.end.withOpacity(isDark ? 0.82 : 0.9),
                ],
              ),
              border: Border.all(
                color: colors.subjectCardBorder.withOpacity(
                  isDark ? 0.45 : 0.7,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: palette.shadow.withOpacity(isDark ? 0.18 : 0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: Icon(section.icon, size: 28, color: palette.foreground),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            topic.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              height: 1.25,
              fontWeight: FontWeight.w600,
              color: colors.subjectCardTitle,
            ),
          ),
        ),
      ],
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
