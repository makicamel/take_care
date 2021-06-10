import 'package:flutter/material.dart';
import 'package:date_calc/date_calc.dart';

import '../models/calendar.dart';
import '../widgets/month.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final days = Calendar.daysOfMonth(DateCalc.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(child: Month(days)),
            ],
          ),
        ),
      ),
    );
  }
}
