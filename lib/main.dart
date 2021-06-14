import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import './screens/calendar_screen.dart';

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
      home: CalendarScreen(),
    );
  }
}
