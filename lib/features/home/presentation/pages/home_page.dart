import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = <({IconData icon, String title, String description})>[
      (
        icon: Icons.calculate_rounded,
        title: 'Mathematics',
        description: 'Numbers, equations, and problem solving',
      ),
      (
        icon: Icons.science_rounded,
        title: 'Physics',
        description: 'Motion, energy, force, and the universe',
      ),
      (
        icon: Icons.biotech_rounded,
        title: 'Chemistry',
        description: 'Atoms, reactions, formulas, and matter',
      ),
      (
        icon: Icons.eco_rounded,
        title: 'Biology',
        description: 'Living organisms, cells, and life systems',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Subjects'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return SubjectCard(
            iconName: subject.icon,
            title: subject.title,
            description: subject.description,
          );
        },
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final IconData iconName;
  final String title;
  final String description;

  const SubjectCard({
    super.key,
    required this.iconName,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppCustomColors>()!;

    return Container(
      decoration: BoxDecoration(
        color: customColors.subjectCardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: customColors.subjectCardBorder),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  customColors.subjectCardIconStart,
                  customColors.subjectCardIconEnd,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(
              iconName,
              color: customColors.subjectCardIconForeground,
              size: 24,
            ),
          ),

          const SizedBox(height: 14),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: customColors.subjectCardTitle,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              height: 1.4,
              color: customColors.subjectCardDescription,
            ),
          ),
        ],
      ),
    );
  }
}
