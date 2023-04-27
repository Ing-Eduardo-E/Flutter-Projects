import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Comida rápida',
        amount: 10.99,
        date: DateTime.now(),
        category: Category.Comida),
    Expense(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.Ocio),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: const [
      Text('El gráfico va aquí'),
      Text('La lista de gastos va aquí'),
    ]));
  }
}
