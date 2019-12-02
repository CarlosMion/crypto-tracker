import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final String title;
  final Widget action;

  CustomAppBar({this.leading, this.title, this.action});

  @override
  Size get preferredSize {
    return new Size.fromHeight(90.0);
  }

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      color: Color.fromRGBO(56, 87, 117, 1.0),
      child: Row(
        children: <Widget>[
          leading ?? Container(),
          buildTitle(),
          buildAction(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      margin: EdgeInsets.only(
        left: 24.0,
        top: 16.0,
      ),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter'),
      ),
    );
  }

  Widget buildAction() {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      alignment: Alignment.centerRight,
      width: 200,
      child: action,
    );
  }
}