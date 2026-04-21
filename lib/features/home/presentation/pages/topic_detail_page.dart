import 'package:elearn_mobile/features/home/domain/entities/subject_catalog.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopicDetailPage extends StatefulWidget {
  const TopicDetailPage({super.key, required this.topic});

  final SubjectTopic topic;

  @override
  State<TopicDetailPage> createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;
    final primary = colors.mathematicsPalette.start;
    final pages = widget.topic.pages.isEmpty
        ? const [
            TopicContentPage(
              heading: 'Mavzu haqida',
              description: 'Bu mavzu uchun malumot keyinroq qoshiladi.',
            ),
          ]
        : widget.topic.pages;
    final page = pages[_pageIndex];
    final isFirst = _pageIndex == 0;
    final isLast = _pageIndex == pages.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              page.heading,
              style: theme.textTheme.titleLarge,
            ),
            if (widget.topic.imageAsset != null) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: widget.topic.imageAsset!.toLowerCase().endsWith('.svg')
                    ? SvgPicture.asset(
                        widget.topic.imageAsset!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        widget.topic.imageAsset!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
            ],
            const SizedBox(height: 12),
            Text(
              page.description,
              style: theme.textTheme.bodyLarge,
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primary,
                      side: BorderSide(color: primary),
                    ),
                    onPressed: () {
                      if (isFirst) {
                        Navigator.of(context).pop();
                        return;
                      }

                      setState(() {
                        _pageIndex--;
                      });
                    },
                    child: const Text('Back'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (isLast) {
                        Navigator.of(context).pop();
                        return;
                      }

                      setState(() {
                        _pageIndex++;
                      });
                    },
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
