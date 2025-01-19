import 'package:expense_tracker_app/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesStete();
  }
}

class _ExpensesStete extends State<Expenses> {
  List<Expense> registerExpense = [
    Expense(
        title: 'jeans',
        amount: 10.00,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'flutter course',
        amount: 11.99,
        date: DateTime.now(),
        category: Category.leasure),
  ];

  void openModalBottomOverlayer() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: addExpense,
      ),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      registerExpense.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final indexExpense = registerExpense.indexOf(expense);
    setState(() {
      registerExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('expense was deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                registerExpense.insert(indexExpense, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('Data is empty, Please add new Expense'),
    );

    if (registerExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: registerExpense,
        onRemoveExpense: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses TrackerApp'),
        actions: [
          IconButton(
            onPressed: openModalBottomOverlayer,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [Expanded(child: mainContent)],
      ),
    );
  }
}
