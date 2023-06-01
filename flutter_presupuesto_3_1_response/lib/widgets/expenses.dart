import 'package:flutter/material.dart';
import 'package:flutter_presupuesto_3/models/expense.dart';
import 'package:flutter_presupuesto_3/widgets/chart/chart.dart';
import 'package:flutter_presupuesto_3/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_presupuesto_3/widgets/new_expense.dart';

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
        category: Category.comida),
    Expense(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.ocio),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

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

  @override
  Widget build(BuildContext context) {
    //La instrucción MediaQuery.of(context).size.width obtiene el ancho de la pantalla
    //actual en píxeles. La clase MediaQuery proporciona información sobre el tamaño y
    //la orientación de la pantalla actual. La propiedad size devuelve un objeto Size
    //que contiene el ancho y el alto de la pantalla actual, y la propiedad width
    //devuelve el ancho de la pantalla actual en píxeles. En este caso, se almacena el ancho de la pantalla en la variable width.
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No hay gastos registrados'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
      // Este código es una expresión ternaria que se utiliza para determinar
      //cómo se mostrará el contenido en función del ancho de la pantalla. Si
      //el ancho de la pantalla es menor que 600 píxeles, se mostrará una
      //columna con un gráfico y el contenido principal. Si el ancho de la
      //pantalla es mayor o igual a 600 píxeles, se mostrará una fila con un
      //gráfico y el contenido principal.

      // En ambos casos, se utiliza el widget Chart para mostrar un gráfico
      //de los gastos registrados y el widget mainContent para mostrar la
      //lista de gastos registrados. El widget Expanded se utiliza para
      //asegurarse de que el contenido principal ocupe todo el espacio
      //disponible en la columna o fila.
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
