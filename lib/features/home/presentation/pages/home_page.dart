import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

typedef _SubjectSection =
    ({
      String title,
    });

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<_SubjectSection> _sections = [
    (
      title: 'Mathematics',
    ),
    (
      title: 'Physics',
    ),
    (
      title: 'Chemistry',
    ),
    (
      title: 'Biology',
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
          final section = _sections[index];
          return _SubjectSectionBlock(section: section);
        },
      ),
    );
  }
}

class _SubjectSectionBlock extends StatelessWidget {
  const _SubjectSectionBlock({required this.section});

  final _SubjectSection section;

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
              color: colors.subjectCardTitle,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.02,
          ),
          itemBuilder: (context, index) {
            return const _SubjectGridCard();
          },
        ),
      ],
    );
  }
}

class _SubjectGridCard extends StatelessWidget {
  const _SubjectGridCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;
    final isDark = theme.brightness == Brightness.dark;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.subjectCardIconStart.withOpacity(isDark ? 0.68 : 0.76),
            colors.subjectCardIconEnd.withOpacity(isDark ? 0.82 : 0.9),
          ],
        ),
        border: Border.all(
          color: colors.subjectCardBorder.withOpacity(isDark ? 0.45 : 0.7),
        ),
        boxShadow: [
          BoxShadow(
            color: colors.subjectCardIconEnd.withOpacity(isDark ? 0.14 : 0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
    );
  }
}
