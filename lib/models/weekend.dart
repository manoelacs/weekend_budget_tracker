import 'package:hive/hive.dart';
import 'expense.dart';

part 'weekend.g.dart';

@HiveType(typeId: 1)
class Weekend extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  List<Expense> expenses;

  Weekend({required this.id, required this.title, required this.expenses});

  Map<String, String> get totalSpentPerCurrency {
    final totals = <String, double>{};

    for (var expense in expenses) {
      totals.update(
        expense.currency,
        (value) => value + expense.amount,
        ifAbsent: () => expense.amount,
      );
    }

    return totals.map((key, value) => MapEntry(key, value.toStringAsFixed(2)));
  }
}
