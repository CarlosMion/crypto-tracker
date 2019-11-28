import 'package:flutter/material.dart';
import './routes.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoTracker Pro',
      onGenerateRoute: routes,
    );
  }
}
