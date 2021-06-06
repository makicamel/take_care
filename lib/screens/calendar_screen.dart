import 'package:flutter/material.dart';
import 'package:date_calc/date_calc.dart';

import '../models/calendar.dart';
import '../widgets/day.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final days = Calendar.daysOfMonthWithPadding(DateCalc.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 7,
                  children: days.map((day) => Day(number: day.day)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
