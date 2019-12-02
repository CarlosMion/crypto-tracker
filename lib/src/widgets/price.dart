import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class Price extends StatelessWidget {
  final double price;
  final String locale;
  final String symbol;

  Price({this.price, this.locale, this.symbol});

  Widget build(context) {
    final currencyFormatter =
        NumberFormat.currency(locale: locale, decimalDigits: 2, symbol: symbol);

    final usdPrice = currencyFormatter.format(price);
    return Text(
      '$usdPrice',
      textAlign: TextAlign.end,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
