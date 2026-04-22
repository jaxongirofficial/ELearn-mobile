import 'package:elearn_mobile/core/theme/app_colors.dart';
import 'dart:math' as math;

import 'package:elearn_mobile/features/onboarding/presentation/widgets/onboarding_orbit_badge.dart';
import 'package:flutter/material.dart';

class OnboardingOrbitHero extends StatefulWidget {
  const OnboardingOrbitHero({required this.isDark, super.key});

  final bool isDark;

  @override
  State<OnboardingOrbitHero> createState() => _OnboardingOrbitHeroState();
}

class _OnboardingOrbitHeroState extends State<OnboardingOrbitHero>
    with SingleTickerProviderStateMixin {
  static const double _orbitPeriodSeconds = 18;
  static const List<_OrbitDotConfig> _orbitDotConfigs = [
    _OrbitDotConfig(radius: 83, size: 14, speed: 1, phase: 4.5),
    _OrbitDotConfig(radius: 83, size: 10, speed: 1, phase: 6.1),
    _OrbitDotConfig(radius: 134, size: 18, speed: -0.8, phase: 0.7),
    _OrbitDotConfig(radius: 134, size: 12, speed: -0.8, phase: 3),
  ];

  static const List<
    ({
      double radius,
      double angle,
      IconData icon,
      List<Color> colors,
    })
  >
  _badgeConfigs = [
    (
      radius: 134.0,
      angle: -math.pi / 2,
      icon: Icons.psychology_alt_rounded,
      colors: AppColors.onboardingBadgeBlueGradient,
    ),
    (
      radius: 83.0,
      angle: -0.45,
      icon: Icons.menu_book_rounded,
      colors: AppColors.onboardingBadgeAmberGradient,
    ),
    (
      radius: 134.0,
      angle: 0.95,
      icon: Icons.bolt_rounded,
      colors: AppColors.onboardingBadgePurpleGradient,
    ),
    (
      radius: 83.0,
      angle: 2.2,
      icon: Icons.auto_stories_rounded,
      colors: AppColors.onboardingBadgeTealGradient,
    ),
    (
      radius: 134.0,
      angle: 3.45,
      icon: Icons.calculate_rounded,
      colors: AppColors.onboardingBadgeRoseGradient,
    ),
  ];

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = widget.isDark ? Brightness.dark : Brightness.light;
    final dotColor = AppColors.onboardingOrbitDotForBrightness(brightness);
    final dotGlow = AppColors.onboardingDotGlow();
    final staticLayer = _OrbitStaticLayer(brightness: brightness);

    return SizedBox(
      height: 325,
      width: 325,
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: _controller,
          child: staticLayer,
          builder: (context, child) {
            final elapsedSeconds =
                (_controller.lastElapsedDuration?.inMilliseconds ?? 0) / 1000;

            return Stack(
              alignment: Alignment.center,
              children: [
                if (child != null) child,
                ..._orbitDots(
                  elapsedSeconds: elapsedSeconds,
                  dotColor: dotColor,
                  dotGlow: dotGlow,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _orbitDots({
    required double elapsedSeconds,
    required Color dotColor,
    required Color dotGlow,
  }) {
    final turns = elapsedSeconds / _orbitPeriodSeconds;

    return _orbitDotConfigs.map((item) {
      final angle = ((turns * item.speed) * 2 * math.pi) + item.phase;
      return Transform.translate(
        offset: Offset(
          item.radius * math.cos(angle),
          item.radius * math.sin(angle),
        ),
        child: _OrbitDot(
          size: item.size,
          color: dotColor,
          glowColor: dotGlow,
        ),
      );
    }).toList();
  }
}

class _OrbitStaticLayer extends StatelessWidget {
  const _OrbitStaticLayer({required this.brightness});

  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.onboardingHeroGradientForBrightness(brightness),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.onboardingHeroGlowForBrightness(
                  brightness,
                ).withOpacity(0.30),
                blurRadius: 30,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: const Icon(
            Icons.rocket_launch_rounded,
            color: AppColors.white,
            size: 48,
          ),
        ),
        Container(
          height: 166,
          width: 166,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.onboardingInnerRingForBrightness(brightness),
              width: 1.2,
            ),
          ),
        ),
        Container(
          height: 268,
          width: 268,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.onboardingOuterRingForBrightness(brightness),
              width: 1.1,
            ),
          ),
        ),
        ..._OnboardingOrbitHeroState._badgeConfigs.map(
          (item) => Transform.translate(
            offset: Offset(
              item.radius * math.cos(item.angle),
              item.radius * math.sin(item.angle),
            ),
            child: OnboardingOrbitBadge(
              icon: item.icon,
              colors: item.colors,
            ),
          ),
        ),
      ],
    );
  }
}

class _OrbitDot extends StatelessWidget {
  const _OrbitDot({
    required this.size,
    required this.color,
    required this.glowColor,
  });

  final double size;
  final Color color;
  final Color glowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [BoxShadow(color: glowColor, blurRadius: 12)],
      ),
    );
  }
}

class _OrbitDotConfig {
  const _OrbitDotConfig({
    required this.radius,
    required this.size,
    required this.speed,
    required this.phase,
  });

  final double radius;
  final double size;
  final double speed;
  final double phase;
}
