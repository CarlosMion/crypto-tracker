import 'package:flutter/material.dart';

import './routes.dart';
import './blocs/list_cryptos/cryptocurrencies_provider.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return CryptocurrenciesProvider(
      child: MaterialApp(
        title: 'CryptoTracker Pro',
        onGenerateRoute: routes,
      ),
    );
  }
}
