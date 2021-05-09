import 'package:flutter/material.dart';

class Day extends StatefulWidget {
  Day({Key key, @required this.number}) : super(key: key);

  final int number;

  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.number.toString());
  }
}
