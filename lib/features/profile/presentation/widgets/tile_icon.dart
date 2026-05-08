import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TileIcon extends StatelessWidget {
  const TileIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.12),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 21),
    );
  }
}
