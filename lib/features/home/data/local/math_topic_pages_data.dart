import 'package:elearn_mobile/features/home/domain/entities/subject_catalog.dart';

List<TopicContentPage> getMathTopicPages(String topic) {
  switch (topic) {
    case 'Sonlar va arifmetika asoslari':
      return const [
        TopicContentPage(
          heading: 'Natural, butun va ratsional sonlar',
          description:
              'Bu bolimda sonlar turlari, ularning tartibi va asosiy xossalari organiladi. '
              'Qoshish, ayirish, kopaytirish va bolish amallari sonlar orasidagi boglanishni tushuntiradi.',
        ),
        TopicContentPage(
          heading: 'Amallar ketma-ketligi',
          description:
              'Murakkab ifodalarni yechishda avval qavs ichidagi amal, keyin daraja, song kopaytirish yoki bolish, '
              'oxirida qoshish yoki ayirish bajariladi.',
        ),
      ];

    default:
      return const [
        TopicContentPage(
          heading: 'Berga title qismini yozmiz ',
          description: 'desc',
        ),
      ];
  }
}
