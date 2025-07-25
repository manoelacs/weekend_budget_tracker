import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weekend_budget_tracker/models/weekend.dart';
import 'package:weekend_budget_tracker/screens/home.dart';
import 'constants/app_theme.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'models/expense.dart';

import 'providers/budget_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseAdapter());

  Hive.registerAdapter(WeekendAdapter());

  await Hive.openBox<Weekend>('weekends');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BudgetNotifier(),
      child: MaterialApp(
        title: 'Weekend Budget Tracker',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system, // 👈 Adapts to user's system setting
        home: const HomeScreen(),
      ),
    );
  }
}
