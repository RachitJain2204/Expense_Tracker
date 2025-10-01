import 'package:expense_tracker/widgets/expenses-list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registerExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Cinema",
      amount: 21.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void openAddExpenseOverlay(){
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: openAddExpenseOverlay, icon: Icon(Icons.add),),
        ],
        title: Text(
          "Flutter ExpenseTracker",
        ),
      ),
      body: Column(
        children: [
          Text("Chart"),
          Expanded(
            child: ExpensesList(
                expenses: registerExpenses
            ),
          ),
        ],
      ),
    );
  }
}
