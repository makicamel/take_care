import 'package:date_calc/date_calc.dart';

class Days {
  DateCalc referenceDate;

  Days(this.referenceDate);

  get _beginningOfWeek => DateTime.monday;

  get _endOfWeek => DateTime.sunday;

  static get emptyDate => DateTime(1000, 1, 1);

  void prevMonth() {
    referenceDate.subtractMonth(1);
  }

  void nextMonth() {
    referenceDate.addMonth(1);
  }

  List<DateTime> ofMonthWithPadding() {
    final previousDaysCount =
        referenceDate.beginningOfMonth().weekday - _beginningOfWeek;
    final followingDaysCount = _endOfWeek - referenceDate.endOfMonth().weekday;

    return _ofMonth()
      ..insertAll(0, List.generate(previousDaysCount, (_) => emptyDate))
      ..addAll(List.generate(followingDaysCount, (_) => emptyDate));
  }

  List<DateTime> _ofMonth() {
    final daysCount = referenceDate.daysInMonth();
    final firstDayOfThisMonth = referenceDate.beginningOfMonth();
    return List.generate(daysCount, (i) => firstDayOfThisMonth.addDay(i));
  }
}
