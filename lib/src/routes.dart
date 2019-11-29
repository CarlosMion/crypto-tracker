import 'package:flutter/material.dart';

import './listCryptoCurrencys/screens/cryptos_list.dart';
import './listCryptoCurrencys/bloc/cryptocurrencies_provider.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (BuildContext context) {
          final cryptocurrenciesBloc = CryptocurrenciesProvider.of(context);

          cryptocurrenciesBloc.fetchCryptos();

          return CryptosList();
        },
      );
    default:
      return null;
  }
}
