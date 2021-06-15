import 'package:flutter/material.dart';
import 'package:date_calc/date_calc.dart';
import 'package:provider/provider.dart';
import 'package:take_care/widgets/month.dart';

import '../models/days.dart';

class CalendarScreen extends StatelessWidget {
  final referenceDate = DateCalc.now();
  final heading = ['月', '火', '水', '木', '金', '土', '日']
      .map((weekday) => Text(weekday))
      .toList();

  CalendarScreen();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Days>(
      create: (_) => Days(referenceDate),
      child: Consumer<Days>(
        builder: (context, days, child) {
          return Scaffold(
            appBar: AppBar(title: Text(days.month)),
            body: Column(
              children: [
                Column(
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 7,
                      children: heading,
                    ),
                    Month(days),
                  ],
                ),
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
            ),
          );
        },
      ),
    );
  }
}
