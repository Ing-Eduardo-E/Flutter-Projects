// Importamos los paquetes y archivos necesarios
import 'package:flutter/material.dart';
import 'package:flutter_questionnaire_2/data/questions.dart';
import 'package:flutter_questionnaire_2/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

// Creamos un widget de pantalla de resultados que es un StateLessWidget
class ResultsScreen extends StatelessWidget {
  // Definimos los parámetros necesarios
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  // Definimos el callback para reiniciar el cuestionario y las respuestas elegidas
  final void Function() onRestart;
  final List<String> chosenAnswers;

  // Creamos un método para generar los datos del resumen de preguntas
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    // Recorremos todas las preguntas y agregamos los datos al resumen
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  // Creamos el widget de pantalla de resultados
  @override
  Widget build(BuildContext context) {
    // Obtenemos los datos del resumen y la cantidad de preguntas y respuestas correctas
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mostramos la cantidad de preguntas y respuestas correctas
            Text(
              'Usted respondió correctamente $numCorrectQuestions de $numTotalQuestions preguntas',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 230, 200, 253),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Mostramos el resumen de preguntas y respuestas
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            // Agregamos un botón para reiniciar el cuestionario
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Reiniciar cuestionario!'),
            )
          ],
        ),
      ),
    );
  }
}
