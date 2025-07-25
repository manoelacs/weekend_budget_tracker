// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekend_budget_tracker/widgets/add_expense_dialog.dart';
import 'package:weekend_budget_tracker/widgets/weekend_summary_card.dart';
import '../providers/budget_provider.dart';
import '../screens/weekend_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weekend Budget Tracker')),
      body: Consumer<BudgetNotifier>(
        builder: (context, budgetNotifier, child) {
          final weekends = budgetNotifier.weekends;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: weekends.length,
                  itemBuilder: (context, index) {
                    final weekend = weekends[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeekendScreen(weekend: weekend),
                        ),
                      ),
                      child: WeekendSummaryCard(weekend: weekend),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddExpenseDialog(
              weekendId:
                  Provider.of<BudgetNotifier>(context).weekends.isNotEmpty
                      ? Provider.of<BudgetNotifier>(context).weekends.first.id
                      : '',
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
