import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../util/constants.dart';
import '../widgets/input_area.dart';

class CryptosAdd extends StatelessWidget {
  Widget build(context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: Colors.white,
        leading: leading(context),
        title: 'Back to list',
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: InputArea(
            label: 'Add a Cryptocurrency',
            hint: 'Use a name or ticket symbol...',
            buttonText: 'Add',
            onSubmit: (cryptocurrency) => print(cryptocurrency),
          ),
        ),
      ),
    );
  }

  Widget leading(BuildContext context) {
    return FlatButton.icon(
      onPressed: () => Navigator.pushNamed(context, LIST_SCREEN_PATH),
      icon: Icon(
        Icons.keyboard_arrow_left,
        color: Color.fromRGBO(56, 87, 117, 1.0),
      ),
      label: Text(
        'Back to list',
        style: TextStyle(
          color: Color.fromRGBO(56, 87, 117, 1.0),
          fontFamily: 'Inter',
          fontSize: 16.0,
        ),
      ),
    );
  }
}
