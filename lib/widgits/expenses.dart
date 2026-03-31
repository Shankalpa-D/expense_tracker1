import 'package:expense_tracker1/models/expense.dart';
import 'package:expense_tracker1/widgits/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Gino's Pizza",
      amount: 20.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Train Ticket",
      amount: 14.99,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Chart Goes here'),
          SizedBox(height: 30),
          ExpensesList(expenses: _registeredExpenses),
        ],
      ),
    );
  }
}
