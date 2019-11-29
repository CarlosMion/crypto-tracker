import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  Widget build(context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: buildContainer(150.0),
          subtitle: buildContainer(150.0),
        ),
        Divider(height: 6.0),
      ],
    );
  }

  Widget buildContainer(width) {
    return Container(
      color: Colors.grey[300],
      height: 24.0,
      width: width,
      margin: EdgeInsets.symmetric(vertical: 5.0),
    );
  }
}
