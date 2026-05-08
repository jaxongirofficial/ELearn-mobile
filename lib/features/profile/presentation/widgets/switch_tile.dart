import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:elearn_mobile/features/profile/presentation/widgets/tile_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchTile extends StatelessWidget {
  const SwitchTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return ListTile(
      onTap: () => onChanged(!value),
      minLeadingWidth: 0,
      contentPadding: const EdgeInsets.only(left: 16, right: 12),
      leading: TileIcon(icon: icon),
      title: Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
          color: colors.subjectCardTitle,
          fontWeight: FontWeight.w800,
        ),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colors.subjectCardDescription,
        ),
      ),
      trailing: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeColor: theme.colorScheme.primary,
      ),
    );
  }
}
