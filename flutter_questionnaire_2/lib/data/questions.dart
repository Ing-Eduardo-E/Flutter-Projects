import 'package:flutter_questionnaire_2/models/quiz_question.dart';

const questions = [
  QuizQuestion('¿Qué es Flutter?', [
    'Un marco de desarrollo móvil',
    'Un lenguaje de programación',
    'Un sistema operativo',
    'Una base de datos',
  ]),
  QuizQuestion('¿Qué lenguaje de programación utiliza Flutter?', [
    'Dart',
    'Java',
    'Python',
    'C++',
  ]),
  QuizQuestion('¿Quién desarrolló Flutter?', [
    'Google',
    'Apple',
    'Microsoft',
    'Amazon',
  ]),
  QuizQuestion(
      '¿Flutter se utiliza para desarrollar aplicaciones para qué plataformas?',
      [
        'iOS y Android',
        'Solo iOS',
        'Solo Android',
        'Ninguna de las anteriores',
      ]),
  QuizQuestion(
      '¿Flutter permite escribir código una sola vez y enviar aplicaciones a qué tiendas?',
      [
        'A la App Store de Apple y a Google Play',
        'Solo a la App Store de Apple',
        'Solo a Google Play',
        'Ninguna de las anteriores',
      ]),
  QuizQuestion('¿Qué es un widget en Flutter?', [
    'Un objeto de la interfaz del usuario',
    'Una función',
    'Una variable',
    'Un archivo de configuración',
  ]),
];
