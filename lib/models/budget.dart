import 'package:hive/hive.dart';
import 'expense.dart';

part 'budget.g.dart';

@HiveType(typeId: 2)
class Budget extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  double totalAmount;

  @HiveField(3)
  List<BudgetExpense> expenses;

  Budget({
    required this.id,
    required this.title,
    required this.totalAmount,
    required this.expenses,
  });

  double get totalSpent => expenses.fold(0.0, (sum, e) => sum + e.amount);

  double get remainingAmount => totalAmount - totalSpent;
}
