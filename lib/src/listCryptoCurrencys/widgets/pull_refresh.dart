import 'package:flutter/material.dart';
import '../bloc/cryptocurrencies_provider.dart';

class Refresh extends StatelessWidget {
  final Widget child;

  Refresh({this.child});

  Widget build(context) {
    final bloc = CryptocurrenciesProvider.of(context);

    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await bloc.fetchCryptoInfo();
      },
    );
  }
}
