import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekend_budget_tracker/models/expense.dart';
import 'package:weekend_budget_tracker/providers/general_budget_provider.dart';

class AddBudgetExpenseScreen extends StatelessWidget {
  const AddBudgetExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    String selectedType = 'Cash In';
    String selectedCategory = 'Food';
    String selectedCurrency = 'USD';

    return Scaffold(
      appBar: AppBar(title: const Text('Add Budget Expense')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  flex: 3, // 60% of the line
                  child: TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  flex: 2, // 40% of the line
                  child: DropdownButtonFormField<String>(
                    value: selectedCurrency,
                    items: const [
                      DropdownMenuItem(value: 'USD', child: Text('USD')),
                      DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                      DropdownMenuItem(value: 'GBP', child: Text('GBP')),
                      DropdownMenuItem(value: 'JPY', child: Text('JPY')),
                    ],
                    onChanged: (value) {
                      selectedCurrency = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Currency',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    dropdownColor: Colors.white,
                    style: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    isExpanded: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedType,
                    items: const [
                      DropdownMenuItem(
                          value: 'Cash In', child: Text('Cash In')),
                      DropdownMenuItem(
                          value: 'Cash Out', child: Text('Cash Out')),
                      DropdownMenuItem(
                          value: 'Credit Card', child: Text('Credit Card')),
                    ],
                    onChanged: (value) {
                      selectedType = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Type',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    dropdownColor: Colors.white,
                    style: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    isExpanded: true,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    items: const [
                      DropdownMenuItem(value: 'Food', child: Text('Food')),
                      DropdownMenuItem(
                          value: 'Transport', child: Text('Transport')),
                      DropdownMenuItem(
                          value: 'Entertainment', child: Text('Entertainment')),
                      DropdownMenuItem(value: 'Other', child: Text('Other')),
                    ],
                    onChanged: (value) {
                      selectedCategory = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    dropdownColor: Colors.white,
                    style: const TextStyle(color: Colors.black),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    isExpanded: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                // Save the budget logic
                Navigator.pop(context);
                // Removed unused 'expense' variable

                // Assuming you have a provider named BudgetProvider
                final budgetProvider =
                    Provider.of<GeneralBudgetProvider>(context, listen: false);
                budgetProvider.addExpense(
                  BudgetExpense(
                    name: descriptionController.text,
                    amount: double.tryParse(amountController.text) ?? 0.0,
                    currency: selectedCurrency,
                    type: selectedType,
                    category: selectedCategory,
                  ),
                );

                // Notify the main screen to update the list
                // Removed unnecessary notifyListeners() call
              },
              child: const Center(
                child: Text(
                  'Save Expense',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
