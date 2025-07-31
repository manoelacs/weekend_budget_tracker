import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weekend.dart';
import '../models/expense.dart';
import '../services/local_storage_service.dart';

class BudgetNotifier extends ChangeNotifier {
  final List<Weekend> _weekends = LocalStorageService.getAllWeekends();

  List<Weekend> get weekends => _weekends;

  Map<String, double> get totalSpentByCurrency {
    final Map<String, double> totals = {};
    for (var weekend in _weekends) {
      for (var expense in weekend.expenses) {
        totals[expense.currency] =
            (totals[expense.currency] ?? 0.0) + expense.amount;
      }
    }
    return totals;
  }

  void addWeekend(Weekend weekend) {
    LocalStorageService.saveWeekend(weekend);
    _weekends.add(weekend);
    notifyListeners();
  }

  void removeWeekend(Weekend weekend) {
    _weekends.remove(weekend);
    notifyListeners();
  }

  void editWeekend(Weekend oldWeekend, Weekend newWeekend) {
    final index = _weekends.indexOf(oldWeekend);
    if (index != -1) {
      _weekends[index] = newWeekend;
      LocalStorageService.saveWeekend(newWeekend);
      notifyListeners();
    }
  }

  void addExpense(String weekendId, WeekendExpense expense) {
    final index = _weekends.indexWhere((w) => w.id == weekendId);
    if (index != -1) {
      _weekends[index].expenses.add(expense);
      LocalStorageService.saveWeekend(_weekends[index]);
      notifyListeners();
    }
  }

  void removeExpense(String weekendId, WeekendExpense expense) {
    final index = _weekends.indexWhere((w) => w.id == weekendId);
    if (index != -1) {
      _weekends[index].expenses.remove(expense);
      LocalStorageService.saveWeekend(_weekends[index]);
      notifyListeners();
    }
  }

  void editExpense(
      String weekendId, WeekendExpense oldExpense, WeekendExpense newExpense) {
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
