import 'package:flutter/material.dart';

class ChangeLast24Hr extends StatelessWidget {
  final double changePercent24Hr;

  ChangeLast24Hr({this.changePercent24Hr});

  Widget build(context) {
    final String roundedChange = changePercent24Hr.toStringAsPrecision(3);
    return Text(
      '$roundedChange%',
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14.0,
        color: changePercent24Hr > 0 ? Colors.green : Colors.red,
      ),
    );
  }
}
