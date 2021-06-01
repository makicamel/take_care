import 'package:flutter/material.dart';

import '../widgets/day.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final days = DateUtils.getDaysInMonth(today.year, today.month) - 1;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 7,
                  children:
                      List.generate(days, (day) => day + 1, growable: false)
                          .map((e) => Day(number: e))
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
