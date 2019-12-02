import 'package:flutter/material.dart';

class ChangeLast24Hr extends StatelessWidget {
  final double changePercent24Hr;

  ChangeLast24Hr({this.changePercent24Hr});

  Widget build(context) {
    final String roundedChange =
        changePercent24Hr.toStringAsFixed(2).replaceAll('-', '');

    final icon = changePercent24Hr > 0
        ? Icon(
            Icons.call_made,
            color: Colors.green,
            size: 15.0,
          )
        : Icon(
            Icons.call_received,
            color: Colors.red,
            size: 15.0,
          );

    return SizedBox(
      height: 15.0,
      width: 57.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 1.0, right: 4.0),
            child: icon,
          ),
          Text(
            '$roundedChange%',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.0,
              color: changePercent24Hr > 0 ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
