import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class UsdPrice extends StatelessWidget {
  final double price;

  UsdPrice({this.price});

  Widget build(context) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'en_US', decimalDigits: 2, symbol: '\$');

    final usdPrice = currencyFormatter.format(price);
    return Text(
      '$usdPrice',
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
