import 'package:flutter/material.dart';
import 'package:flutter_presupuesto_3/models/expense.dart';
import 'package:flutter_presupuesto_3/widgets/expenses_list/expense_item.dart';

// Clase ExpensesList que extiende de StatelessWidget
class ExpensesList extends StatelessWidget {
  // Constructor de la clase con parámetros requeridos
  const ExpensesList({
    Key? key,
    required this.expenses,
    required this.onRemoveExpense,
  }) : super(key: key);

  // Lista de objetos Expense
  final List<Expense> expenses;
  // Función que se ejecuta al eliminar un gasto
  final void Function(Expense expense) onRemoveExpense;

  // Método build que construye el widget
  @override
  Widget build(BuildContext context) {
    // Widget ListView.builder que construye una lista desplazable de forma eficiente
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        // Widget Container que contiene otros widgets y permite personalizar su apariencia
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        // Widget ExpenseItem que muestra información sobre un gasto
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
