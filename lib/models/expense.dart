import 'dart:convert';

import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 0)
class Expense extends HiveObject {
  @HiveField(0)
  final String id = base64Encode(
      Hive.generateSecureKey()); // Automatically generate a unique ID

  @HiveField(1)
  String name;

  @HiveField(2)
  double amount;

  @HiveField(3)
  String currency;

  @HiveField(4)
  DateTime date;

  Expense({
    required this.name,
    required this.amount,
    required this.currency,
    DateTime? date,
  }) : date = date ?? DateTime.now();
}

@HiveType(typeId: 1)
class WeekendExpense extends Expense {
  WeekendExpense({
    required super.name,
    required super.amount,
    required super.currency,
    super.date,
  });
}

@HiveType(typeId: 2)
class BudgetExpense extends Expense {
  @HiveField(5)
  String category;

  @HiveField(6)
  String type; // e.g., 'Cash In', 'Cash Out'

  BudgetExpense({
    required super.name,
    required super.amount,
    required super.currency,
    required this.category,
    required this.type,
    super.date,
  });
}
