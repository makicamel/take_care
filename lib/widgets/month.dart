import 'package:flutter/material.dart';
import 'package:date_calc/date_calc.dart';

import '../models/days.dart';
import './day.dart';

class Month extends StatelessWidget {
  final DateCalc referenceDate;

  Month(this.referenceDate);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      children: Days(referenceDate)
          .ofMonthWithPadding()
          .map((day) => Day(day: day))
          .toList(),
    );
  }
}
