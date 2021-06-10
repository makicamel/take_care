import 'package:date_calc/date_calc.dart';

class Calendar {
  static List<DateTime> daysOfMonth(DateCalc day) {
    final daysCount = day.daysInMonth();
    final firstDayOfThisMonth = day.beginningOfMonth();
    return List.generate(daysCount, (i) => firstDayOfThisMonth.addDay(i));
  }
}
