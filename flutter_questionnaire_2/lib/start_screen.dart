import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Imagen del logo del cuestionario
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          // Texto de presentación del cuestionario
          Text(
            "Aprende Flutter de manera divertida!",
            style: GoogleFonts.roboto(
              fontSize: 24,
              color: const Color.fromARGB(255, 242, 227, 250),
            ),
          ),
          const SizedBox(height: 30),
          // Botón para iniciar el cuestionario
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 242, 227, 250),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Inicio de cuestionario'),
          )
        ],
      ),
    );
  }
}
