// widgets/add_expense_dialog.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/expense.dart';
import '../models/weekend.dart';
import '../providers/budget_provider.dart';
import '../services/weekend_service.dart';

class AddExpenseDialog extends StatefulWidget {
  final String weekendId;

  const AddExpenseDialog({super.key, required this.weekendId});

  @override
  State<AddExpenseDialog> createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final currencyController = TextEditingController(text: 'USD');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Expense'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Expense Name'),
            ),
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  decoration: const InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: currencyController.text,
                  items: const [
                    DropdownMenuItem(value: 'USD', child: Text('USD')),
                    DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                    DropdownMenuItem(value: 'BRL', child: Text('BRL')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      currencyController.text = value!;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Currency'),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final name = nameController.text.trim();
            final amount = double.tryParse(amountController.text) ?? 0.0;
            final currency = currencyController.text;

            // Input validation
            if (name.isEmpty || amount <= 0 || currency.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Please fill all fields correctly.')),
              );
              return;
            }

            final budgetNotifier =
                Provider.of<BudgetNotifier>(context, listen: false);

            // Ensure the weekend exists before adding the expense
            if (!budgetNotifier.weekends.any((w) => w.id == widget.weekendId)) {
              budgetNotifier.addWeekend(Weekend(
                id: widget.weekendId,
                title: WeekendService.getWeekendTitle(
                    DateTime.now()), // Generate title using current date
                expenses: [],
              ));
            }

            final expense =
                Expense(name: name, amount: amount, currency: currency);

            try {
              budgetNotifier.addExpense(widget.weekendId, expense);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Expense added successfully!')),
              );
              Navigator.pop(context);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to add expense.')),
              );
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
