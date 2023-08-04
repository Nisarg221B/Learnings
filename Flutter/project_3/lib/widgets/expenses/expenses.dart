import 'package:flutter/material.dart';
import 'package:project3/widgets/expenses/expenses_list_items/expenses_list.dart';
import 'package:project3/models/expense.dart';
import 'package:project3/widgets/expenses/new_expense.dart';
import 'package:project3/widgets/chart/chart.dart';


class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 450,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Movie',
        amount: 200,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void addExpense(Expense newx) {
    setState(() {
      _registeredExpenses.add(newx);
    });
  }

  void _removeExpense(Expense delx) {
    final expenseIndex = _registeredExpenses.indexOf(delx);
    setState(() {
      _registeredExpenses.remove(delx);
    });
    // clears all the existing info messages we have on the screen
    ScaffoldMessenger.of(context).clearSnackBars(); // see the effect by commenting this line
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted.'),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, delx);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return NewExpense(addExpense: addExpense);
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found,Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
