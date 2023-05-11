import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { comida, viaje, ocio, trabajo }

const categoryIcons = {
  Category.comida: Icons.lunch_dining,
  Category.viaje: Icons.flight_takeoff,
  Category.ocio: Icons.movie,
  Category.trabajo: Icons.work,
};

class Expense {
  // Clase Expense representa un gasto
  Expense({
    required this.title, // Título del gasto
    required this.amount, // Cantidad gastada
    required this.date, // Fecha del gasto
    required this.category, // Categoría del gasto
  }) : id = uuid.v4(); // Identificador único del gasto

  final String id; // Identificador único del gasto
  final String title; // Título del gasto
  final double amount; // Cantidad gastada
  final DateTime date; // Fecha del gasto
  final Category category; // Categoría del gasto

  String get formattedDate => formatter
      .format(date); // Fecha formateada para mostrar en la interfaz de usuario
}

class ExpenseBucket {
  // Clase ExpenseBucket representa un conjunto de gastos de una categoría específica
  ExpenseBucket({
    required this.category, // Categoría de los gastos en el conjunto
    required this.expenses, // Lista de los gastos en el conjunto
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList(); // Filtra los gastos que pertenecen a la categoría específica

  final Category category; // Categoría de los gastos en el conjunto
  final List<Expense> expenses; // Lista de los gastos en el conjunto

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
