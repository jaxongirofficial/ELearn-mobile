import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController xController = TextEditingController();
  final TextEditingController yController = TextEditingController();

  double result = 0;

  void calculate() {
    final x = double.tryParse(xController.text) ?? 0;
    final y = double.tryParse(yController.text) ?? 0;

    setState(() {
      result = sqrt(x * x + y * y);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 📐 Formula
            Math.tex(
              r"\sqrt{x^2 + y^2}",
              textStyle: const TextStyle(fontSize: 28, color: Colors.white),
            ),

            const SizedBox(height: 30),

            /// 🔢 Inputlar
            TextField(
              controller: xController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "x qiymati",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: yController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "y qiymati",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            /// ▶️ Button
            ElevatedButton(
              onPressed: calculate,
              child: const Text("Hisoblash"),
            ),

            const SizedBox(height: 20),

            /// 📊 Result
            Text(
              "Natija: $result",
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
