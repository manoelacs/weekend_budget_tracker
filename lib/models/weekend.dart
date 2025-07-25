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

  double get totalSpent => expenses.fold(0.0, (sum, e) => sum + e.amount);
}
