import 'package:flutter/material.dart';
import 'package:flutter_presupuesto_3/models/expense.dart';

// Clase ExpenseItem que extiende de StatelessWidget
class ExpenseItem extends StatelessWidget {
  // Constructor de la clase con parámetros requeridos
  const ExpenseItem(this.expense, {Key? key}) : super(key: key);

  // Objeto Expense
  final Expense expense;

  // Método build que construye el widget
  @override
  Widget build(BuildContext context) {
    // Widget Card que representa una tarjeta con esquinas redondeadas y sombra
    return Card(
      // Widget Padding que agrega un relleno alrededor del hijo
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        // Widget Column que organiza a sus hijos en una columna vertical
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Widget Text que muestra texto
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            // Widget Row que organiza a sus hijos en una fila horizontal
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                // Widget Row que organiza a sus hijos en una fila horizontal
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
