import 'package:flutter/material.dart';

class InputArea extends StatelessWidget {
  final String label;
  final String hint;
  final String buttonText;
  final Function onSubmit;

  InputArea({this.label, this.hint, this.buttonText, this.onSubmit});

  Widget build(context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              height: 36.0,
            ),
          ),
        ],
      ),
    );
  }
}
