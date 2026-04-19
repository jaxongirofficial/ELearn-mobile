import 'package:elearn_mobile/features/home/data/math_topic_pages_data.dart';
import 'package:elearn_mobile/features/home/presentation/models/subject_catalog.dart';
import 'package:flutter/material.dart';

final List<SubjectSection> subjectSections = [
  SubjectSection(
    type: SubjectType.mathematics,
    title: 'Mathematics',
    icon: Icons.calculate_rounded,
    topics: [
      SubjectTopic(
        title: 'Sonlar va arifmetika asoslari',
        symbol: 'sqrt13',
        pages: getMathTopicPages('Sonlar va arifmetika asoslari'),
        imageAsset: 'assets/icons/library.svg',
      ),
      SubjectTopic(
        title: 'Algebraik ifodalar va formulalar',
        symbol: 'x2-1',
        pages: getMathTopicPages('Algebraik ifodalar va formulalar'),
      ),
      SubjectTopic(
        title: 'Tenglamalar va tengsizliklar (boshlangich)',
        symbol: 'x>=0',
        pages: getMathTopicPages('Tenglamalar va tengsizliklar (boshlangich)'),
      ),
      SubjectTopic(
        title: 'Funksiya va grafiklar',
        symbol: 'f(x)',
        pages: getMathTopicPages('Funksiya va grafiklar'),
      ),
      SubjectTopic(
        title: 'Darajalar va ildizlar',
        symbol: '2^4x3^2',
        pages: getMathTopicPages('Darajalar va ildizlar'),
      ),
      SubjectTopic(
        title: 'Kvadrat tenglamalar va teoremalar',
        symbol: 'ax^2+bx+c',
        pages: getMathTopicPages('Kvadrat tenglamalar va teoremalar'),
      ),
      SubjectTopic(
        title: 'Murakkab tenglamalar va ifodalar',
        symbol: '(x+y)^2',
        pages: getMathTopicPages('Murakkab tenglamalar va ifodalar'),
      ),
      SubjectTopic(
        title: 'Logarifmlar va korsatkichli tenglamalar',
        symbol: 'e^z',
        pages: getMathTopicPages('Logarifmlar va korsatkichli tenglamalar'),
      ),
      SubjectTopic(
        title: 'Progressiyalar',
        symbol: 'a_n',
        pages: getMathTopicPages('Progressiyalar'),
      ),
    ],
  ),
];
