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
    final textStyle = const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w900,
      letterSpacing: 0.2,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryLight],
        ),
        border: Border.all(
          color: AppColors.primaryLight.withOpacity(0.9),
          width: 1.1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.42),
            blurRadius: 24,
            offset: const Offset(0, 11),
          ),
          BoxShadow(
            color: AppColors.primaryLight.withOpacity(0.26),
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.n900,
          shadowColor: AppColors.transparent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          textStyle: textStyle,
        ),
        child: Text(label),
      ),
    );
  }
}
