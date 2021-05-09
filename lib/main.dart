import 'package:flutter/material.dart';

void main() {
  runApp(TakeCare());
}

class TakeCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Take Care',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calendar(title: 'Calendar'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [Text('Hello, Flutter!')],
        ),
      ),
    );
  }
}
