import 'package:flutter/material.dart';

class Day extends StatelessWidget {
  final DateTime day;

  Day({Key key, @required this.day})
      : assert(day != null),
        super(key: key);

  static get emptyDate => DateTime(1000, 1, 1);

  @override
  Widget build(BuildContext context) {
    return day == emptyDate ? Text('') : Text(day.day.toString());
  }
}
