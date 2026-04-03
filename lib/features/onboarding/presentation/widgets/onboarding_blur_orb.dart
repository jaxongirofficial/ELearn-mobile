import 'dart:ui';

import 'package:flutter/material.dart';

class OnboardingBlurOrb extends StatelessWidget {
  const OnboardingBlurOrb({
    required this.size,
    required this.color,
    super.key,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
