import 'package:flutter/material.dart';
import 'dart:async';

import 'loading_container.dart';
import '../api/models/crypto_model.dart';
import '../blocs/cryptocurrencies_provider.dart';
import './slidable_list_tile.dart';
import '../widgets/usd_price.dart';

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
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SlidableListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              child: Image.network(
                  'https://static.coincap.io/assets/icons/${crypto.symbol.toLowerCase()}@2x.png'),
              foregroundColor: Colors.white,
            ),
            title: Text(crypto.name),
            subtitle: Text(crypto.symbol),
            trailling: Column(
              children: <Widget>[
                UsdPrice(crypto.priceUsd),
                Text(crypto.changePercent24Hr)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(
              height: 6.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
