import 'package:flutter/material.dart';

import '../models/days.dart';

class Day extends StatelessWidget {
  final DateTime day;

  Day({Key key, @required this.day})
      : assert(day != null),
        super(key: key);

  get _emptyDate => Days.emptyDate;

  @override
  Widget build(BuildContext context) {
    return day == _emptyDate ? Text('') : Text(day.day.toString());
  }
}
