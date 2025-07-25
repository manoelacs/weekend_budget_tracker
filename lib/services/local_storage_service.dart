import 'package:hive_flutter/hive_flutter.dart';
import '../models/expense.dart';
import '../models/weekend.dart';

class LocalStorageService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ExpenseAdapter());
    Hive.registerAdapter(WeekendAdapter());
    await Hive.openBox<Weekend>('weekends');
  }

  static Box<Weekend> getWeekendsBox() {
    return Hive.box<Weekend>('weekends');
  }

  static Future<void> saveWeekend(Weekend weekend) async {
    await getWeekendsBox().put(weekend.id, weekend);
  }

  static List<Weekend> getAllWeekends() {
    return getWeekendsBox().values.toList();
  }

  static void saveExpense(Expense expense) {}

  static List<Expense> getAllExpenses() {
    // Fetch all expenses by iterating through weekends and collecting their expenses
    return getAllWeekends().expand((weekend) => weekend.expenses).toList();
  }
}
