import 'package:flutter/material.dart';
import 'package:flutter_questionnaire_2/data/questions.dart';
import 'package:flutter_questionnaire_2/questions_screen.dart';
import 'package:flutter_questionnaire_2/start_screen.dart';
import 'package:flutter_questionnaire_2/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  // Cambiar a la pantalla de preguntas
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // Agregar la respuesta seleccionada
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    // Si se han respondido todas las preguntas, cambiar a la pantalla de resultados
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  // Reiniciar el cuestionario
  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Iniciar en la pantalla de inicio
    Widget screenWidget = StartScreen(switchScreen);

    // Cambiar a la pantalla de preguntas si se ha seleccionado el botón de inicio
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    // Cambiar a la pantalla de resultados si se han respondido todas las preguntas
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        //Agregamos un container con un gradiente
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
