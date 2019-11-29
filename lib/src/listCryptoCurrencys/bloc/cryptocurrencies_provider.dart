import 'package:flutter/material.dart';

import 'cryptocurrencies_bloc.dart';
export 'cryptocurrencies_bloc.dart';

class CryptocurrenciesProvider extends InheritedWidget {
  final CryptocurrenciesBloc bloc;

  CryptocurrenciesProvider({Key key, Widget child})
      : bloc = CryptocurrenciesBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static CryptocurrenciesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CryptocurrenciesProvider)
            as CryptocurrenciesProvider)
        .bloc;
  }
}
