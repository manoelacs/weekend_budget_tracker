import 'package:flutter/material.dart';
import '../../models/weekend.dart';
import '../../models/expense.dart';
import 'details_screen.dart';

class WeekendsListScreen extends StatelessWidget {
  const WeekendsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Weekend> weekends = [
      Weekend(
        id: '1',
        title: 'July 12-13, 2025',
        expenses: [
          WeekendExpense(
              name: 'Lunch',
              amount: 20.5,
              currency: 'USD',
              date: DateTime(2025, 7, 12)),
          WeekendExpense(
              name: 'Drinks',
              amount: 12.0,
              currency: 'USD',
              date: DateTime(2025, 7, 12)),
        ],
      ),
      Weekend(
        id: '2',
        title: 'July 19-20, 2025',
        expenses: [
          WeekendExpense(
              name: 'Beach Trip',
              amount: 45.0,
              currency: 'EUR',
              date: DateTime(2025, 7, 19)),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekend Budget Tracker'),
      ),
      body: ListView.builder(
        itemCount: weekends.length,
        itemBuilder: (context, index) {
          final weekend = weekends[index];
          return ListTile(
            title: Text(weekend.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: weekend.totalSpentPerCurrency.entries.map((entry) {
                return Text(
                  '${entry.key}: ${entry.value}',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList(),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WeekendDetailScreen(weekend: weekend),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
