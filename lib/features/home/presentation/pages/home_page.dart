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
        SubjectTopic(title: 'Sonlar va arifmetika asoslari', symbol: '√13'),
        SubjectTopic(title: 'Algebraik ifodalar va formulalar', symbol: 'x²-1'),
        SubjectTopic(
          title: 'Tenglamalar va tengsizliklar (boshlangich)',
          symbol: 'x ≥ 0',
        ),
        SubjectTopic(title: 'Funksiya va grafiklar', symbol: 'f(x)'),
        SubjectTopic(title: 'Darajalar va ildizlar', symbol: '2⁴×3²'),
        SubjectTopic(title: 'Kvadrat tenglamalar va teoremalar', symbol: 'ax²+bx+c'),
        SubjectTopic(title: 'Murakkab tenglamalar va ifodalar', symbol: '(x+y)²'),
        SubjectTopic(
          title: 'Logarifmlar va korsatkichli tenglamalar',
          symbol: 'eᶻ',
        ),
        SubjectTopic(title: 'Progressiyalar', symbol: 'aₙ'),
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
        centerTitle: false,
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
            childAspectRatio: 0.67,
          ),
          itemBuilder: (context, index) {
            return FractionallySizedBox(
              widthFactor: 0.92,
              child: _SubjectGridCard(
                section: section,
                topic: section.topics[index],
              ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    topic.symbol,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'serif',
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0.05,
                      color: palette.foreground.withOpacity(
                        isDark ? 0.92 : 0.88,
                      ),
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
        const SizedBox(height: 8),
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
                fontSize: 12,
                height: 1.25,
                fontWeight: FontWeight.w600,
                color: colors.subjectCardTitle,
              ),
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
