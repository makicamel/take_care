import 'package:date_calc/date_calc.dart';

import '../widgets/day.dart';

class Days {
  final DateCalc referenceDate;

  Days(this.referenceDate);

  get _beginningOfWeek => DateTime.monday;

  get _endOfWeek => DateTime.sunday;

  get _emptyDate => Day.emptyDate;

  List<DateTime> ofMonthWithPadding() {
    final previousDaysCount =
        referenceDate.beginningOfMonth().weekday - _beginningOfWeek;
    final followingDaysCount = _endOfWeek - referenceDate.endOfMonth().weekday;

    return _ofMonth()
      ..insertAll(0, List.generate(previousDaysCount, (_) => _emptyDate))
      ..addAll(List.generate(followingDaysCount, (_) => _emptyDate));
  }

  List<DateTime> _ofMonth() {
    final daysCount = referenceDate.daysInMonth();
    final firstDayOfThisMonth = referenceDate.beginningOfMonth();
    return List.generate(daysCount, (i) => firstDayOfThisMonth.addDay(i));
  }
}
