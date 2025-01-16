import 'package:expense_tracker_app/expenses_list.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesStete();
  }
}

class _ExpensesStete extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    List<Expense> _registerExpense = [
      Expense(
          title: 'jeans',
          amount: 10.00,
          date: DateTime.now(),
          category: Category.shop),
      Expense(
          title: 'flutter course',
          amount: 11.99,
          date: DateTime.now(),
          category: Category.leasure),
    ];

    return Scaffold(
      body: Column(
        children: [
          Text('aku ingin jadi kaya'),
          Expanded(
            child: ExpensesList(expenses: _registerExpense),
          )
        ],
      ),
    );
  }
}
