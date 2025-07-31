import 'package:flutter/material.dart';
import '../../models/budget.dart';

class BudgetSummaryCard extends StatelessWidget {
  final Budget budget;

  const BudgetSummaryCard({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              budget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text('Total Amount: ${budget.totalAmount.toStringAsFixed(2)}'),
            Text('Total Spent: ${budget.totalSpent.toStringAsFixed(2)}'),
            Text('Remaining: ${budget.remainingAmount.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
