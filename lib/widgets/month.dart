import 'package:flutter/material.dart';
import 'package:date_calc/date_calc.dart';

import './day.dart';

class Month extends StatelessWidget {
  Month(this.referenceDate);

  final DateTime referenceDate;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      children: _daysOfMonth(referenceDate)
          .map((day) => Day(number: day.day))
          .toList(),
    );
  }

  List<DateTime> _daysOfMonth(DateTime originalDate) {
    final day = DateCalc.fromDateTime(originalDate);
    final daysCount = day.daysInMonth();
    final firstDayOfThisMonth = day.beginningOfMonth();
    return List.generate(daysCount, (i) => firstDayOfThisMonth.addDay(i));
  }
}
