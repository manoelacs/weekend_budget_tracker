import 'package:flutter/material.dart';
import '../models/weekend.dart';

class WeekendSummaryCard extends StatelessWidget {
  final Weekend weekend;

  const WeekendSummaryCard({super.key, required this.weekend});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weekend.title,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      // Add edit functionality here
                    } else if (value == 'delete') {
                      // Add delete functionality here
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...weekend.expenses.take(3).map((expense) => Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        '- ${expense.name}: ${expense.currency} ${expense.amount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    )),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    // Navigate to the detailed expenses screen
                  },
                  child: Text(
                    'See more',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Total Spent: ',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: weekend.totalSpentPerCurrency.entries.map((entry) {
                return Text(
                  '${entry.key}: ${entry.value}',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
