import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Calculator Screen",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
