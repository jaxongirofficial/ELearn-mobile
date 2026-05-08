import 'package:elearn_mobile/features/profile/presentation/widgets/about_info_tile.dart';
import 'package:elearn_mobile/features/profile/presentation/widgets/profile_detail_scaffold.dart';
import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileDetailScaffold(
      title: 'Help center',
      children: [
        AboutInfoTile(
          icon: Icons.question_answer_outlined,
          title: 'Questions',
          description: 'Find answers about lessons, calculator, and profile.',
        ),
        AboutInfoTile(
          icon: Icons.feedback_outlined,
          title: 'Feedback',
          description: 'Share ideas or report issues to improve eLearn.',
        ),
        AboutInfoTile(
          icon: Icons.support_agent_rounded,
          title: 'Support',
          description: 'Support tools will be connected in the next version.',
        ),
      ],
    );
  }
}
