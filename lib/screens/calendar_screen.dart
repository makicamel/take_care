import 'package:flutter/material.dart';
import 'package:date_calc/date_calc.dart';
import 'package:provider/provider.dart';
import 'package:take_care/widgets/month.dart';

import '../models/days.dart';

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
      body: ChangeNotifierProvider<Days>(
        create: (_) => Days(referenceDate),
        child: Consumer<Days>(
          builder: (context, days, child) {
            return Column(
              children: [
                Expanded(child: Month(days)),
                Row(
                  children: [
                    Spacer(),
                    ElevatedButton(
                      child: const Text('Prev'),
                      onPressed: () => days.prevMonth(),
                    ),
                    Spacer(),
                    ElevatedButton(
                      child: const Text('Next'),
                      onPressed: () => days.nextMonth(),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
