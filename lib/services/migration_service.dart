import 'package:hive/hive.dart';
import '../models/expense.dart';

class MigrationService {
  static Future<void> migrateExpenses(int currentVersion) async {
    var expenseBox = Hive.box<Expense>('expenses');

    if (currentVersion < 2) {
      // Migration for version 2: Add default date to existing expenses
      for (var key in expenseBox.keys) {
        var expense = expenseBox.get(key);
        if (expense != null) {
          // Assign a default value to the date property
          expense.date = DateTime.now();
          await expenseBox.put(key, expense);
        }
      }
    }

    // Add more migrations for future versions here
  }

  static Future<void> applyMigrations() async {
    var settingsBox = await Hive.openBox('settings');
    int currentVersion = settingsBox.get('schemaVersion', defaultValue: 1);

    await migrateExpenses(currentVersion);

    // Update the schema version
    await settingsBox.put('schemaVersion', 2);
  }
}
