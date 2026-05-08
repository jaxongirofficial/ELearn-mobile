import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.username,
    required this.controller,
    required this.isEditing,
    required this.onEdit,
    required this.onSave,
    required this.onCancel,
  });

  final String username;
  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback onEdit;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Avatar(username: username),
          const SizedBox(width: 12),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: _NicknameBlock(
                username: username,
                controller: controller,
                isEditing: isEditing,
                onSave: onSave,
              ),
            ),
          ),
          if (isEditing) ...[
            IconButton(
              onPressed: onCancel,
              icon: Icon(
                Icons.close_rounded,
                color: colors.subjectCardDescription,
              ),
            ),
            IconButton(
              onPressed: onSave,
              icon: Icon(
                Icons.check_rounded,
                color: theme.colorScheme.primary,
              ),
            ),
          ] else
            IconButton(
              onPressed: onEdit,
              icon: Icon(Icons.edit_rounded, color: colors.subjectCardTitle),
            ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 70,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.22),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Text(
        _initials(username),
        style: theme.textTheme.headlineSmall?.copyWith(
          color: AppColors.n900,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  static String _initials(String value) {
    final parts = value.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return 'S';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return '${parts.first.substring(0, 1)}${parts.last.substring(0, 1)}'
        .toUpperCase();
  }
}

class _NicknameBlock extends StatelessWidget {
  const _NicknameBlock({
    required this.username,
    required this.controller,
    required this.isEditing,
    required this.onSave,
  });

  final String username;
  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 180),
      child: isEditing
          ? TextField(
              key: const ValueKey('nickname-field'),
              controller: controller,
              autofocus: true,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => onSave(),
              style: theme.textTheme.titleMedium?.copyWith(
                color: colors.subjectCardTitle,
                fontWeight: FontWeight.w900,
              ),
              decoration: const InputDecoration(
                hintText: 'Nickname',
                isDense: true,
              ),
            )
          : Column(
              key: const ValueKey('nickname-text'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: colors.subjectCardTitle,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '@${username.toLowerCase().replaceAll(' ', '')}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.subjectCardDescription,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
    );
  }
}
