import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingWelcomeActionButton extends StatelessWidget {
  const OnboardingWelcomeActionButton({
    required this.onPressed,
    required this.isDark,
    required this.label,
    super.key,
  });

  final VoidCallback onPressed;
  final bool isDark;
  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.primaryGradientForBrightness(
            isDark ? Brightness.dark : Brightness.light,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGlowForBrightness(
              isDark ? Brightness.dark : Brightness.light,
            ).withOpacity(0.28),
            blurRadius: 26,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.white,
          shadowColor: AppColors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.2,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
