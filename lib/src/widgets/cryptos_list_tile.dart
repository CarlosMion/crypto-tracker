import 'package:flutter/material.dart';
import 'dart:async';

import 'loading_container.dart';
import '../api/models/crypto_model.dart';
import '../blocs/cryptocurrencies_provider.dart';

class CryptosListTile extends StatelessWidget {
  final String cryptoId;

  CryptosListTile({this.cryptoId});

  Widget build(context) {
    final bloc = CryptocurrenciesProvider.of(context);

    return StreamBuilder(
      stream: bloc.cryptos,
      builder:
          (context, AsyncSnapshot<Map<String, Future<CryptoModel>>> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        return FutureBuilder(
          future: snapshot.data[cryptoId],
          builder: (context, AsyncSnapshot<CryptoModel> cryptoSnapshot) {
            if (!cryptoSnapshot.hasData) {
              return LoadingContainer();
            }

            return buildTile(context, cryptoSnapshot.data);
          },
        );
      },
    );
  }

  Widget buildTile(BuildContext context, CryptoModel crypto) {
    return Column(
      children: <Widget>[ListTile()],
    );
  }
}
