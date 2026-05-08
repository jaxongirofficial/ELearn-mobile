import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:elearn_mobile/features/profile/presentation/widgets/tile_icon.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailingText,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? trailingText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return ListTile(
      onTap: onTap,
      minLeadingWidth: 0,
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
      trailing: trailingText == null
          ? Icon(Icons.chevron_right_rounded, color: colors.description)
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  trailingText!,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.chevron_right_rounded, color: colors.description),
              ],
            ),
    );
  }
}
