import 'package:flutter/material.dart';

class ProfileDetailScaffold extends StatelessWidget {
  const ProfileDetailScaffold({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: theme.colorScheme.background,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: children,
      ),
    );
  }
}
