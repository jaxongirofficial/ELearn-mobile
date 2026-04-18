import 'package:flutter/material.dart';

enum SubjectType { mathematics, physics, chemistry, biology }

class SubjectTopic {
  const SubjectTopic({required this.title});

  final String title;
}

class SubjectSection {
  const SubjectSection({
    required this.type,
    required this.title,
    required this.icon,
    required this.topics,
  });

  final SubjectType type;
  final String title;
  final IconData icon;
  final List<SubjectTopic> topics;
}
