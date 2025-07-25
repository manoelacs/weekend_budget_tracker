import 'package:flutter/material.dart';
import '../models/weekend.dart';

class WeekendSummaryCard extends StatelessWidget {
  final Weekend weekend;

  const WeekendSummaryCard({super.key, required this.weekend});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(weekend.title),
        subtitle: Text('Total Spent: ${weekend.totalSpent.toStringAsFixed(2)}'),
      ),
    );
  }
}
