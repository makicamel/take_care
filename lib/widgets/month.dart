import 'package:flutter/material.dart';

import '../models/days.dart';
import './day.dart';

class Month extends StatelessWidget {
  final Days days;

  Month(this.days);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      children: days.ofMonthWithPadding().map((day) => Day(day: day)).toList(),
    );
  }
}
