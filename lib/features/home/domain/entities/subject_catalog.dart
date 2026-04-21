import 'package:flutter/material.dart';

enum SubjectType { mathematics, physics, chemistry, biology }

class TopicContentPage {
  const TopicContentPage({
    required this.heading,
    required this.description,
  });

  final String heading;
  final String description;
}

class SubjectTopic {
  const SubjectTopic({
    required this.title,
    required this.symbol,
    required this.pages,
    this.imageAsset,
  });

  final String title;
  final String symbol;
  final List<TopicContentPage> pages;
  final String? imageAsset;
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
