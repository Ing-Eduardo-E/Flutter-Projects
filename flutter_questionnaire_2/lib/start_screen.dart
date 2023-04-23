import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(void Function() startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/quiz-logo.png",
            width: 300, color: const Color.fromARGB(150, 255, 255, 255)),
        const SizedBox(height: 80),
        const Text(
          "Aprende Flutter de manera divertida!",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 242, 227, 250),
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 242, 227, 250),
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Inicio de cuestionario'),
        )
      ],
    ));
  }
}
