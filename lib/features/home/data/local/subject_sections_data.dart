import 'package:elearn_mobile/features/home/data/local/math_topic_pages_data.dart';
import 'package:elearn_mobile/features/home/domain/entities/subject_catalog.dart';
import 'package:flutter/material.dart';

final List<SubjectSection> subjectSections = [
  SubjectSection(
    type: SubjectType.mathematics,
    title: 'Mathematics',
    icon: Icons.calculate_rounded,
    topics: [
      SubjectTopic(
        title: 'Sonlar va arifmetika asoslari',
        symbol: '123',
        pages: getMathTopicPages('Sonlar va arifmetika asoslari'),
        imageAsset: 'assets/icons/library.svg',
      ),
      SubjectTopic(
        title: 'Algebraik ifodalar va formulalar',
        symbol: 'x+y',
        pages: getMathTopicPages('Algebraik ifodalar va formulalar'),
      ),
      SubjectTopic(
        title: 'Tenglamalar va tengsizliklar (boshlangich)',
        symbol: 'x=?',
        pages: getMathTopicPages('Tenglamalar va tengsizliklar (boshlangich)'),
      ),
      SubjectTopic(
        title: 'Funksiya va grafiklar',
        symbol: 'f(x)',
        pages: getMathTopicPages('Funksiya va grafiklar'),
      ),
      SubjectTopic(
        title: 'Darajalar va ildizlar',
        symbol: '√x',
        pages: getMathTopicPages('Darajalar va ildizlar'),
      ),
      SubjectTopic(
        title: 'Kvadrat tenglamalar va teoremalar',
        symbol: 'ax²',
        pages: getMathTopicPages('Kvadrat tenglamalar va teoremalar'),
      ),
      SubjectTopic(
        title: 'Murakkab tenglamalar va ifodalar',
        symbol: '(x+y)²',
        pages: getMathTopicPages('Murakkab tenglamalar va ifodalar'),
      ),
      SubjectTopic(
        title: 'Logarifmlar va korsatkichli tenglamalar',
        symbol: 'logₐx',
        pages: getMathTopicPages('Logarifmlar va korsatkichli tenglamalar'),
      ),
      SubjectTopic(
        title: 'Progressiyalar',
        symbol: 'aₙ',
        pages: getMathTopicPages('Progressiyalar'),
      ),
    ],
  ),
];
