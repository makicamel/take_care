import 'package:flutter/material.dart';
import 'package:date_calc/date_calc.dart';
import 'package:intl/intl.dart';

import '../widgets/month.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({Key key, this.title}) : super(key: key);

  String title;

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  var referenceDate = DateCalc.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(child: Month(referenceDate)),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                    child: const Text('Prev'),
                    onPressed: () => _addMonth(),
                  ),
                  Spacer(),
                  ElevatedButton(
                    child: const Text('Next'),
                    onPressed: () => _subtractMonth(),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addMonth() {
    setState(() {
      referenceDate = referenceDate.subtractMonth(1);
      widget.title = DateFormat.yM('ja_JP').format(referenceDate);
    });
  }

  void _subtractMonth() {
    setState(() {
      referenceDate = referenceDate.addMonth(1);
      widget.title = DateFormat.yM('ja_JP').format(referenceDate);
    });
  }
}
