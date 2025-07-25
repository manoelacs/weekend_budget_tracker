import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 0)
class Expense extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  double amount;

  @HiveField(2)
  String currency;

  @HiveField(3)
  DateTime date;

  Expense({
    required this.name,
    required this.amount,
    required this.currency,
    DateTime? date,
  }) : date = date ?? DateTime.now();
}
