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
  _SubjectSectionBlock({required this.section});

  final SubjectSection section;

  static const List<SubjectPalette> _topicPalettes = [
    SubjectPalette(
      start: Color(0xFF9DBE14),
      end: Color(0xFFD7FF39),
      foreground: Colors.white,
      shadow: Color(0x66D7FF39),
    ),
    SubjectPalette(
      start: Color(0xFF0DB9BF),
      end: Color(0xFF2DE9E3),
      foreground: Colors.white,
      shadow: Color(0x662DE9E3),
    ),
    SubjectPalette(
      start: Color(0xFF9053E8),
      end: Color(0xFFB975FF),
      foreground: Colors.white,
      shadow: Color(0x66B975FF),
    ),
    SubjectPalette(
      start: Color(0xFFF0A11A),
      end: Color(0xFFFFC13A),
      foreground: Colors.white,
      shadow: Color(0x66FFC13A),
    ),
  ];

  final List<String> images = [
    'assets/images/123.png',
    'assets/images/x2.png',
    'assets/images/tengsizlik.png',
    'assets/images/functions.png',
  ];

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var index = 0; index < section.topics.length; index++) ...[
              SubjectTopicCard(
                title: section.topics[index].title,
                subtitle: _subtitleFor(section.topics[index]),
                cardColors: _topicPalettes[index % _topicPalettes.length],
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RouteNames.topicDetail,
                    arguments: section.topics[index],
                  );
                },
                imagePath: images[index % images.length],
              ),
              if (index != section.topics.length - 1)
                const SizedBox(height: 10),
            ],
          ],
        ),
      ],
    );
  }

  String _subtitleFor(SubjectTopic topic) {
    switch (topic.title) {
      case 'Sonlar va arifmetika asoslari':
        return 'Sonlar va amallar asoslari.';
      case 'Algebraik ifodalar va formulalar':
        return 'Ifoda va formulalarni soddalashtiring.';
      case 'Tenglamalar va tengsizliklar (boshlangich)':
        return 'Oddiy tenglama va tengsizliklar.';
      case 'Funksiya va grafiklar':
        return 'Funksiya va grafiklar bilan ishlash.';
      case 'Darajalar va ildizlar':
        return 'Daraja va ildiz xossalarini organing.';
      case 'Kvadrat tenglamalar va teoremalar':
        return 'Kvadrat tenglamalarni tez yeching.';
      case 'Murakkab tenglamalar va ifodalar':
        return 'Murakkab ifodalar va yechimlar.';
      case 'Logarifmlar va korsatkichli tenglamalar':
        return 'Logarifm va eksponent tenglamalar.';
      case 'Progressiyalar':
        return 'Arifmetik va geometrik progressiyalar.';
      default:
        return topic.pages.isEmpty
            ? 'Qisqa dars va mashqlar.'
            : topic.pages.first.description;
    }
  }
}
