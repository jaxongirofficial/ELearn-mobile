import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:elearn_mobile/features/profile/presentation/widgets/about_info_tile.dart';
import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: const Text('About eLearn'),
        backgroundColor: theme.colorScheme.background,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: colors.subjectCardBackground,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: colors.subjectCardBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    color: AppColors.n900,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'eLearn Mobile',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: colors.subjectCardTitle,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'A study app for learning math, physics, and chemistry with lessons, tools, and quick practice.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.subjectCardDescription,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const AboutInfoTile(
            icon: Icons.calculate_outlined,
            title: 'Universal calculator',
            description: 'Scientific tools and constants for school subjects.',
          ),
          const AboutInfoTile(
            icon: Icons.menu_book_outlined,
            title: 'Learning content',
            description: 'Topic-based lessons designed for simple navigation.',
          ),
          const AboutInfoTile(
            icon: Icons.person_outline_rounded,
            title: 'Personal profile',
            description: 'Keep your nickname and study preferences in one place.',
          ),
          const SizedBox(height: 14),
          Text(
            'Version 1.0.0',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.subjectCardDescription,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
