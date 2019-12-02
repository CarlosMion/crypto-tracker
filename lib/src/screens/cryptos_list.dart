import 'package:flutter/material.dart';

import '../widgets/user_icon.dart';
import '../widgets/custom_app_bar.dart';
import '../util/constants.dart';
import '../blocs/cryptocurrencies_provider.dart';
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
          return Refresh(child: LoadingContainer());
        }

        return Refresh(
          child: ListView.builder(
            itemCount: listOfCryptoIds.data.length,
            itemBuilder: (context, int index) {
              bloc.fetchCryptoInfo(listOfCryptoIds.data[index]);

              return CryptosListTile(cryptoId: listOfCryptoIds.data[index]);
            },
          ),
        );
      },
    );
  }
}
