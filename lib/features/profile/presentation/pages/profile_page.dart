import 'package:elearn_mobile/features/profile/presentation/pages/details/about_app_page.dart';
import 'package:elearn_mobile/features/profile/presentation/pages/details/help_center_page.dart';
import 'package:elearn_mobile/features/profile/presentation/pages/details/language_page.dart';
import 'package:elearn_mobile/features/profile/presentation/pages/details/privacy_security_page.dart';
import 'package:elearn_mobile/features/profile/presentation/widgets/profile_header.dart';
import 'package:elearn_mobile/features/profile/presentation/widgets/profile_tile.dart';
import 'package:elearn_mobile/features/profile/presentation/widgets/settings_section.dart';
import 'package:elearn_mobile/features/profile/presentation/widgets/switch_tile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.username = 'Javohir'});

  final String username;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _notificationsEnabled = true;
  var _isEditingUsername = false;
  late var _username = widget.username;
  late final TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: _username);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        backgroundColor: theme.colorScheme.background,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
          children: [
            ProfileHeader(
              username: _username,
              controller: _usernameController,
              isEditing: _isEditingUsername,
              onEdit: _startUsernameEdit,
              onSave: _saveUsername,
              onCancel: _cancelUsernameEdit,
            ),
            const SizedBox(height: 14),
            SettingsSection(
              children: [
                SwitchTile(
                  icon: Icons.notifications_none_rounded,
                  title: 'Notifications',
                  subtitle: 'Study reminders and app updates',
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() => _notificationsEnabled = value);
                  },
                ),
                ProfileTile(
                  icon: Icons.language_rounded,
                  title: 'Language',
                  subtitle: 'English',
                  trailingText: 'EN',
                  onTap: () => _openProfilePage(const LanguagePage()),
                ),
                ProfileTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy and security',
                  subtitle: 'Password and app permissions',
                  onTap: () => _openProfilePage(const PrivacySecurityPage()),
                ),
                ProfileTile(
                  icon: Icons.help_outline_rounded,
                  title: 'Help center',
                  subtitle: 'Questions and feedback',
                  onTap: () => _openProfilePage(const HelpCenterPage()),
                ),
                ProfileTile(
                  icon: Icons.info_outline_rounded,
                  title: 'About eLearn',
                  subtitle: 'Version 1.0.0',
                  onTap: () => _openProfilePage(const AboutAppPage()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _startUsernameEdit() {
    setState(() {
      _usernameController.text = _username;
      _isEditingUsername = true;
    });
  }

  void _saveUsername() {
    final trimmed = _usernameController.text.trim();
    if (trimmed.isEmpty) return;
    setState(() {
      _username = trimmed;
      _isEditingUsername = false;
    });
  }

  void _cancelUsernameEdit() {
    setState(() {
      _usernameController.text = _username;
      _isEditingUsername = false;
    });
  }

  void _openProfilePage(Widget page) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => page));
  }
}
