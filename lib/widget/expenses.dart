import 'package:expense_tracker_app/widget/expenses_list/expenses_list.dart';
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
        context: context,
        builder: (ctx) => Text('Modal Bottom shet'),
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
        children: [
          Text('aku ingin jadi kaya'),
          Expanded(
            child: ExpensesList(expenses: registerExpense),
          )
        ],
      ),
    );
  }
}
