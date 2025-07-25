// widgets/expense_tile.dart
import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseTile extends StatelessWidget {
  final Expense expense;

  const ExpenseTile({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(expense.name),
      subtitle:
          Text('${expense.amount.toStringAsFixed(2)} ${expense.currency}'),
    );
  }
}
