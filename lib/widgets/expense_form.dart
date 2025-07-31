import 'package:flutter/material.dart';

class ExpenseForm extends StatelessWidget {
  final void Function(String name, double amount, String currency) onSubmit;

  const ExpenseForm({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final amountController = TextEditingController();
    final currencyController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Expense Name'),
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: currencyController,
            decoration: const InputDecoration(labelText: 'Currency'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              final name = nameController.text;
              final amount = double.tryParse(amountController.text) ?? 0.0;
              final currency = currencyController.text;
              onSubmit(name, amount, currency);
            },
            child: const Text('Add Expense'),
          ),
        ],
      ),
    );
  }
}
