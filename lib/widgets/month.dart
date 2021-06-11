import 'package:flutter/material.dart';
import 'package:date_calc/date_calc.dart';

import './day.dart';

class Month extends StatelessWidget {
  final DateCalc referenceDate;

  Month(referenceDate)
      : this.referenceDate = DateCalc.fromDateTime(referenceDate);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      children: _daysOfMonth(referenceDate)
          .map((day) => Day(number: day.day))
          .toList(),
    );
  }

  List<DateTime> _daysOfMonth(DateCalc day) {
    final daysCount = day.daysInMonth();
    final firstDayOfThisMonth = day.beginningOfMonth();
    return List.generate(daysCount, (i) => firstDayOfThisMonth.addDay(i));
  }
}
