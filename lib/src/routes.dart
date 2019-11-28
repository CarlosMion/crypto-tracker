import 'package:flutter/material.dart';

import './listCryptoCurrencys/screens/cryptos_list.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return CryptosList();
        },
      );
    default:
      return null;
  }
}
