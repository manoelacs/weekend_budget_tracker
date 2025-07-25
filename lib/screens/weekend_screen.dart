// screens/weekend_screen.dart
import 'package:flutter/material.dart';
import '../models/weekend.dart';
import '../widgets/expense_list.dart';
import '../widgets/add_expense_dialog.dart';

class WeekendScreen extends StatelessWidget {
  final Weekend weekend;

  const WeekendScreen({super.key, required this.weekend});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(weekend.title)),
      body: ExpenseList(expenses: weekend.expenses),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddExpenseDialog(weekendId: weekend.id),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
