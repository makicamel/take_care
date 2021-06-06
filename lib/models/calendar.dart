import 'package:date_calc/date_calc.dart';

class Calendar {
  static beginningOfWeek() => DateTime.monday;

  static endOfWeek() => DateTime.sunday;

  static DateCalc endDayOfPreviousMonth(DateCalc day) {
    return day.subtractMonth(1).endOfMonth();
  }

  static List<int> daysOfMonthWithPadding(DateCalc day) {
    final daysCount = day.daysInMonth();
    var days = List.generate(daysCount, (i) => 1 + i);
    List<int> previousDays = [];
    List<int> followingDays = [];

    if (day.beginningOfMonth().weekday != beginningOfWeek()) {
      final previousDaysCount =
          day.beginningOfMonth().weekday - beginningOfWeek();
      final lastDay = endDayOfPreviousMonth(day).day;
      previousDays = List.generate(previousDaysCount, (i) => lastDay - i);
    }
    if (day.endOfMonth().weekday != endOfWeek()) {
      final followingDaysCount = endOfWeek() - day.endOfMonth().weekday;
      final firstDay = 1;
      followingDays = List.generate(followingDaysCount, (i) => firstDay + i);
    }

    return days
      ..insertAll(0, previousDays)
      ..addAll(followingDays);
  }
}
