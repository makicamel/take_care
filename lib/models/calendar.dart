import 'package:date_calc/date_calc.dart';

class Calendar {
  static beginningOfWeek() => DateTime.monday;

  static endOfWeek() => DateTime.sunday;

  static DateCalc endDayOfPreviousMonth(DateCalc day) {
    return day.subtractMonth(1).endOfMonth();
  }

  static DateCalc firstDayOfNextMonth(DateCalc day) {
    return day.addMonth(1).beginningOfMonth();
  }

  static List<DateTime> daysOfMonthWithPadding(DateCalc day) {
    final daysCount = day.daysInMonth();
    final firstDayOfThisMonth = day.beginningOfMonth();
    var days = List.generate(daysCount, (i) => firstDayOfThisMonth.addDay(i));
    List<DateCalc> previousDays = [];
    List<DateCalc> followingDays = [];

    if (day.beginningOfMonth().weekday != beginningOfWeek()) {
      final previousDaysCount =
          day.beginningOfMonth().weekday - beginningOfWeek();
      final lastDay = endDayOfPreviousMonth(day);
      previousDays =
          List.generate(previousDaysCount, (i) => lastDay.subtractDay(i));
    }
    if (day.endOfMonth().weekday != endOfWeek()) {
      final followingDaysCount = endOfWeek() - day.endOfMonth().weekday;
      final firstDay = firstDayOfNextMonth(day);
      followingDays =
          List.generate(followingDaysCount, (i) => firstDay.addDay(i));
    }

    return days
      ..insertAll(0, previousDays)
      ..addAll(followingDays);
  }
}
