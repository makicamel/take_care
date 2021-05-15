import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'components/day.dart';

void main() {
  initializeDateFormatting('ja_JP', null).then((_) => {});
  runApp(TakeCare());
}

class TakeCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = DateFormat.yM('ja_JP').format(DateTime.now());
    return MaterialApp(
      title: 'Take Care',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calendar(title: title),
    );
  }
}

class Calendar extends StatefulWidget {
  Calendar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
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
