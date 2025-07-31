import 'package:flutter/material.dart';
import 'package:weekend_budget_tracker/screens/budget_tracker/budget_add_expense_screen.dart';

import '../../constants/app_theme.dart';

class BudgetTrackerScreen extends StatelessWidget {
  const BudgetTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: budgetTheme,
      child: Scaffold(
        appBar: AppBar(title: const Text('Budget Tracker')),
        body: ListView.builder(
          itemCount: 10, // Replace with the actual number of expenses
          itemBuilder: (context, index) {
            return ListTile(
              title:
                  Text('Expense #$index'), // Replace with actual expense data
              subtitle: Text('Details for expense #$index'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpenseDetailScreen(expenseId: index),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddBudgetExpenseScreen()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ExpenseDetailScreen extends StatelessWidget {
  final int expenseId;

  const ExpenseDetailScreen({super.key, required this.expenseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense #$expenseId')),
      body: Center(
        child: Text('Details for expense #$expenseId'),
      ),
    );
  }
}
