import 'package:flutter/material.dart';
import 'package:date_calc/date_calc.dart';

import './day.dart';

class Month extends StatelessWidget {
  final DateCalc referenceDate;

  Month(referenceDate)
      : this.referenceDate = DateCalc.fromDateTime(referenceDate);

  get _beginningOfWeek => DateTime.monday;

  get _endOfWeek => DateTime.sunday;

  get _emptyDate => Day.emptyDate;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      children: _daysOfMonthWithPadding().map((day) => Day(day: day)).toList(),
    );
  }

  List<DateTime> _daysOfMonthWithPadding() {
    final previousDaysCount =
        referenceDate.beginningOfMonth().weekday - _beginningOfWeek;
    final followingDaysCount = _endOfWeek - referenceDate.endOfMonth().weekday;

    return _daysOfMonth()
      ..insertAll(0, List.generate(previousDaysCount, (_) => _emptyDate))
      ..addAll(List.generate(followingDaysCount, (_) => _emptyDate));
  }

  List<DateTime> _daysOfMonth() {
    final daysCount = referenceDate.daysInMonth();
    final firstDayOfThisMonth = referenceDate.beginningOfMonth();
    return List.generate(daysCount, (i) => firstDayOfThisMonth.addDay(i));
  }
}
