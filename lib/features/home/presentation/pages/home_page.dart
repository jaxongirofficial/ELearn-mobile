import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Math.tex(
          r"\int_0^{\pi} \sqrt{x} \, dx",
          textStyle: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
