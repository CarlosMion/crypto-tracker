import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class CryptosAdd extends StatelessWidget {
  Widget build(context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.keyboard_arrow_left),
        title: 'Back to list',
      ),
      body: Center(),
    );
  }
}
