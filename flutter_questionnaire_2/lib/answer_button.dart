import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  // Constructor para definir el texto de la respuesta y la función que se ejecuta cuando se hace clic en el botón.
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  // Variables requeridas para construir el botón.
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Función que se ejecuta cuando se hace clic en el botón.
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        // Definir el tamaño del botón y el color de fondo.
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        // Definir el color del texto.
        foregroundColor: Colors.white,
        // Definir la forma del botón.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        // Texto de la respuesta proporcionado en answerText.
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
