import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingOrbitBadge extends StatelessWidget {
  const OnboardingOrbitBadge({
    required this.icon,
    required this.colors,
    super.key,
  });

  final IconData icon;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        border: Border.all(color: AppColors.onboardingBadgeBorder()),
        boxShadow: [
          BoxShadow(
            color: colors.last.withOpacity(0.32),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Icon(icon, color: AppColors.white, size: 22),
    );
  }
}
