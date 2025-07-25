import 'package:intl/intl.dart';

class WeekendService {
  static String getWeekendTitle(DateTime date) {
    final formatter = DateFormat('MMM dd, yyyy');
    final saturday = date.subtract(Duration(days: date.weekday - 6));
    final sunday = saturday.add(const Duration(days: 1));
    return '${formatter.format(saturday)} - ${formatter.format(sunday)}';
  }
}
