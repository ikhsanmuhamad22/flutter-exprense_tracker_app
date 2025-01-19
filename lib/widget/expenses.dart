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

  void addExpense(Expense expense) {
    setState(() {
      registerExpense.add(expense);
    });
  }
    void openModalBottomOverlayer() {
      showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: addExpense,
      ),
      );
    }

  @override
  Widget build(BuildContext context) {
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
        children: [
          Expanded(
            child: ExpensesList(expenses: registerExpense),
          )
        ],
      ),
    );
  }
}
