import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class SubjectDetailPage extends StatelessWidget {
  const SubjectDetailPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;
    final backgroundColor = theme.colorScheme.background;
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colors.subjectCardIconStart.withOpacity(isDark ? 0.68 : 0.78),
                colors.subjectCardIconEnd.withOpacity(isDark ? 0.82 : 0.92),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: colors.subjectCardIconForeground),
              const SizedBox(height: 16),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: colors.subjectCardIconForeground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
