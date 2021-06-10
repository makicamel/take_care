import 'package:flutter/material.dart';

import './day.dart';

class Month extends StatelessWidget {
  Month(this.days);

  final List<DateTime> days;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      children: days.map((day) => Day(number: day.day)).toList(),
    );
  }
}
