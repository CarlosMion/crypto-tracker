import 'package:flutter/material.dart';
import 'dart:async';

import './screens/cryptos_list.dart';
import './blocs/list_cryptos/cryptocurrencies_provider.dart';
import 'blocs/add_cryptos/add_cryptos_provider.dart';
import './screens/cryptos_add.dart';
import './util/constants.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case LIST_SCREEN_PATH:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          final cryptocurrenciesBloc = CryptocurrenciesProvider.of(context);

          cryptocurrenciesBloc.fetchCryptos();

          Timer.periodic(Duration(seconds: 10),
              (_) => cryptocurrenciesBloc.fetchCryptos());

          return CryptosList();
        },
      );
    case ADD_CRYPTOCURRENCY_SCREEN_PATH:
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return AddCryptosProvider(
            child: CryptosAdd(),
          );
        },
      );
    default:
      return null;
  }
}
