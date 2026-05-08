import 'package:elearn_mobile/features/profile/presentation/widgets/about_info_tile.dart';
import 'package:elearn_mobile/features/profile/presentation/widgets/profile_detail_scaffold.dart';
import 'package:flutter/material.dart';

class PrivacySecurityPage extends StatelessWidget {
  const PrivacySecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileDetailScaffold(
      title: 'Privacy and security',
      children: [
        AboutInfoTile(
          icon: Icons.lock_outline_rounded,
          title: 'Account protection',
          description: 'Your profile settings stay inside the app.',
        ),
        AboutInfoTile(
          icon: Icons.shield_outlined,
          title: 'Privacy',
          description: 'Learning preferences are used only for app experience.',
        ),
        AboutInfoTile(
          icon: Icons.manage_accounts_outlined,
          title: 'Permissions',
          description: 'Manage app permissions from your device settings.',
        ),
      ],
    );
  }
}
