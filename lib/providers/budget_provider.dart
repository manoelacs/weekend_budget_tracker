import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weekend.dart';
import '../models/expense.dart';
import '../services/local_storage_service.dart';

class BudgetNotifier extends ChangeNotifier {
  final List<Weekend> _weekends = LocalStorageService.getAllWeekends();

  List<Weekend> get weekends => _weekends;

  double get totalSpent =>
      _weekends.fold(0.0, (sum, weekend) => sum + weekend.totalSpent);

  void addWeekend(Weekend weekend) {
    LocalStorageService.saveWeekend(weekend);
    _weekends.add(weekend);
    notifyListeners();
  }

  void removeWeekend(Weekend weekend) {
    _weekends.remove(weekend);
    notifyListeners();
  }

  void addExpense(String weekendId, Expense expense) {
    final index = _weekends.indexWhere((w) => w.id == weekendId);
    if (index != -1) {
      _weekends[index].expenses.add(expense);
      LocalStorageService.saveWeekend(_weekends[index]);
      notifyListeners();
    }
  }

  void removeExpense(String weekendId, Expense expense) {
    final index = _weekends.indexWhere((w) => w.id == weekendId);
    if (index != -1) {
      _weekends[index].expenses.remove(expense);
      LocalStorageService.saveWeekend(_weekends[index]);
      notifyListeners();
    }
  }

  void editExpense(String weekendId, Expense oldExpense, Expense newExpense) {
    final index = _weekends.indexWhere((w) => w.id == weekendId);
    if (index != -1) {
      final expenses = _weekends[index].expenses;
      final expenseIndex = expenses.indexOf(oldExpense);
      if (expenseIndex != -1) {
        expenses[expenseIndex] = newExpense;
        LocalStorageService.saveWeekend(_weekends[index]);
        notifyListeners();
      }
    }
  }
}

final budgetProvider =
    ChangeNotifierProvider(create: (context) => BudgetNotifier());
