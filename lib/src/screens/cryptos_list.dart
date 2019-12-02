import 'package:flutter/material.dart';

import '../widgets/user_icon.dart';
import '../widgets/custom_app_bar.dart';
import '../util/constants.dart';
import '../blocs/list_cryptos/cryptocurrencies_provider.dart';
import '../widgets/loading_container.dart';
import '../widgets/pull_refresh.dart';
import '../widgets/cryptos_list_tile.dart';

class CryptosList extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = CryptocurrenciesProvider.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: APP_NAME,
        action: UserIcon(),
      ),
      body: buildCryptosList(bloc),
    );
  }

  Widget buildCryptosList(CryptocurrenciesBloc bloc) {
    return StreamBuilder(
      stream: bloc.listCryptos,
      builder: (context, AsyncSnapshot<List<String>> listOfCryptoIds) {
        if (!listOfCryptoIds.hasData) {
          return Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 24.0),
            child: FlatButton.icon(
              onPressed: () =>
                  Navigator.pushNamed(context, ADD_CRYPTOCURRENCY_SCREEN_PATH),
              icon: Icon(
                Icons.add,
                color: Color.fromRGBO(56, 87, 117, 1.0),
              ),
              label: Text(
                'Add a Cryptocurrency',
                style: TextStyle(
                  color: Color.fromRGBO(56, 87, 117, 1.0),
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        }

        return Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Refresh(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listOfCryptoIds.data.length,
                  itemBuilder: (context, int index) {
                    bloc.fetchCryptoInfo(listOfCryptoIds.data[index]);

                    return CryptosListTile(
                        cryptoId: listOfCryptoIds.data[index]);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24.0),
                child: FlatButton.icon(
                  onPressed: () => Navigator.pushNamed(
                      context, ADD_CRYPTOCURRENCY_SCREEN_PATH),
                  icon: Icon(
                    Icons.add,
                    color: Color.fromRGBO(56, 87, 117, 1.0),
                  ),
                  label: Text(
                    'Add a Cryptocurrency',
                    style: TextStyle(
                      color: Color.fromRGBO(56, 87, 117, 1.0),
                      fontFamily: 'Inter',
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
