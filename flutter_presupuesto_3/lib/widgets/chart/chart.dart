import 'package:flutter/material.dart';
import 'package:flutter_presupuesto_3/widgets/chart/chart_bar.dart';
import 'package:flutter_presupuesto_3/models/expense.dart';

// Clase Chart que extiende de StatelessWidget
class Chart extends StatelessWidget {
  // Constructor de la clase con parámetros requeridos
  const Chart({Key? key, required this.expenses}) : super(key: key);

  // Lista de objetos Expense
  final List<Expense> expenses;

  // Getter que devuelve una lista de objetos ExpenseBucket para cada categoría
  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.comida),
      ExpenseBucket.forCategory(expenses, Category.ocio),
      ExpenseBucket.forCategory(expenses, Category.viaje),
      ExpenseBucket.forCategory(expenses, Category.trabajo),
    ];
  }

  // Getter que devuelve el valor máximo de gastos totales
  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  // Método build que construye el widget
  @override
  Widget build(BuildContext context) {
    // Variable que determina si el modo oscuro está activado
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    // Widget Container que contiene otros widgets y permite personalizar su apariencia
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      // Widget Column que organiza a sus hijos en una columna vertical
      child: Column(
        children: [
          // Widget Expanded que expande el hijo para llenar el espacio disponible
          Expanded(
            // Widget Row que organiza a sus hijos en una fila horizontal
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Widget Row que organiza a sus hijos en una fila horizontal
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    // Widget Padding que agrega un relleno alrededor del hijo
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      // Widget Icon que muestra un ícono
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
