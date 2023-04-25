// Clase QuizQuestion que representa una pregunta de cuestionario.
class QuizQuestion {
  // Constructor que recibe el texto de la pregunta y una lista de respuestas.
  const QuizQuestion(this.text, this.answers);

  // Propiedad que almacena el texto de la pregunta.
  final String text;

  // Propiedad que almacena una lista de respuestas.
  final List<String> answers;

  // Función que baraja la lista de respuestas.
  List<String> getshuffledAnswers() {
    // Se crea una nueva lista a partir de la lista de respuestas.
    final shuffledList = List.of(answers);
    // Se baraja la lista utilizando el método shuffle de la clase List.
    shuffledList.shuffle();
    // Se retorna la lista barajada.
    return shuffledList;
  }
}
