// Importar paquetes y archivos necesarios
import 'package:flutter/material.dart';
import 'package:flutter_questionnaire_2/questions_summary/summary_item.dart';

// Definir una clase "QuestionsSummary" como un widget de estado inmutable
class QuestionsSummary extends StatelessWidget {
  // Constructor que recibe "summaryData" y una clave opcional
  const QuestionsSummary(this.summaryData, {super.key});

  // Variable que almacena los datos resumidos de las preguntas
  final List<Map<String, Object>> summaryData;

  // Método "build" para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              // Retornar un "SummaryItem" para cada conjunto de datos resumidos
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
