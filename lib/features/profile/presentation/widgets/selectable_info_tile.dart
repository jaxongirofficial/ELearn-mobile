import 'package:elearn_mobile/core/theme/theme_extensions.dart';
import 'package:elearn_mobile/features/profile/presentation/widgets/tile_icon.dart';
import 'package:flutter/material.dart';

class SelectableInfoTile extends StatelessWidget {
  const SelectableInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppCustomColors>()!;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colors.subjectCardBackground,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? theme.colorScheme.primary : colors.subjectCardBorder,
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Row(
          children: [
            TileIcon(icon: icon),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: colors.subjectCardTitle,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.subjectCardDescription,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              Icon(Icons.check_circle_rounded, color: theme.colorScheme.primary),
          ],
        ),
      ),
    );
  }
}
