import 'package:elearn_mobile/app/routes/route_names.dart';
import 'package:elearn_mobile/features/onboarding/presentation/widgets/onboarding_welcome_step.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWelcomeStep(
        key: const ValueKey('welcome-step'),
        onGetStarted: _completeOnboarding,
      ),
    );
  }

  void _completeOnboarding() {
    Navigator.of(context).pushReplacementNamed(RouteNames.main);
  }
}
