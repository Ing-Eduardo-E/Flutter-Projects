import 'package:flutter/material.dart';
import 'package:flutter_presupuesto_3/models/expense.dart';
import 'package:flutter_presupuesto_3/widgets/chart/chart.dart';
import 'package:flutter_presupuesto_3/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_presupuesto_3/widgets/new_expense.dart';

// Clase Expenses que extiende de StatefulWidget
class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

// Clase _ExpensesState que extiende de State<Expenses>
class _ExpensesState extends State<Expenses> {
  // Lista de objetos Expense
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Comida rápida',
        amount: 10.99,
        date: DateTime.now(),
        category: Category.comida),
    Expense(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.ocio),
  ];

  // Método que abre un modal para agregar un nuevo gasto
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  // Método que agrega un nuevo gasto a la lista
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  // Método que elimina un gasto de la lista
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Gasto eliminado'),
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  // Método build que construye el widget
  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No hay gastos registrados'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    // Widget Scaffold que implementa la estructura básica de diseño visual de Material Design
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presupuesto personal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
