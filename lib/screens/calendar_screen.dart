import 'package:flutter/material.dart';
import 'package:date_calc/date_calc.dart';
import 'package:provider/provider.dart';
import 'package:take_care/widgets/month.dart';

import '../models/days.dart';

class CalendarScreen extends StatelessWidget {
  var referenceDate = DateCalc.now();

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
            ),
          );
        },
      ),
    );
  }
}
