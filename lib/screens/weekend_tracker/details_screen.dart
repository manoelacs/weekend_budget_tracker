import 'package:flutter/material.dart';
import '../../models/weekend.dart';
import '../../models/expense.dart';

class WeekendDetailScreen extends StatelessWidget {
  final Weekend weekend;

  const WeekendDetailScreen({super.key, required this.weekend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weekend.title),
      ),
      body: ListView.builder(
        itemCount: weekend.expenses.length,
        itemBuilder: (context, index) {
          final Expense expense = weekend.expenses[index];
          return ListTile(
            title: Text(expense.name),
            subtitle: Text(
                '${expense.amount.toStringAsFixed(2)} ${expense.currency}'),
          );
        },
      ),
    );
  }
}
