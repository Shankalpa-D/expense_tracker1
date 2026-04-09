import 'package:expense_tracker1/models/expense.dart';
import 'package:expense_tracker1/widgits/expenses_list/expenses_list.dart';
import 'package:expense_tracker1/widgits/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
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
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

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

    Expense(
      title: "Movie Night",
      amount: 12.50,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),

        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart Goes here'),
          const SizedBox(height: 30),
          Expanded(
            child: ExpensesList(
              onRemoveExpense: _removeExpense,
              expenses: _registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
