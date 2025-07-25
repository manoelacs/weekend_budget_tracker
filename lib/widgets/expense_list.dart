// widgets/expense_list.dart
import 'package:flutter/material.dart';
import 'package:weekend_budget_tracker/widgets/expense_title.dart';
import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ExpenseTile(expense: expenses[index]);
      },
    );
  }
}
