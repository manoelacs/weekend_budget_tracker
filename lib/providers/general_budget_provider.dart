import 'package:flutter/material.dart';
import 'package:weekend_budget_tracker/models/expense.dart';
import '../models/budget.dart';

class GeneralBudgetProvider with ChangeNotifier {
  final Budget _budget = Budget(
    id: 'main',
    title: 'Main Budget',
    totalAmount: 0.0,
    expenses: [],
  );

  Budget get budget => _budget;

  void addExpense(BudgetExpense expense) {
    _budget.expenses.add(expense);
    notifyListeners();
  }

  void removeExpense(String expenseId) {
    _budget.expenses.removeWhere((expense) => expense.id == expenseId);
    notifyListeners();
  }

  double get totalIncome => _budget.expenses
      .where((expense) => expense.type == 'Income')
      .fold(0.0, (sum, expense) => sum + expense.amount);

  double get totalExpense => _budget.expenses
      .where((expense) => expense.type == 'Expense')
      .fold(0.0, (sum, expense) => sum + expense.amount);

  double get balance => totalIncome - totalExpense;
}
