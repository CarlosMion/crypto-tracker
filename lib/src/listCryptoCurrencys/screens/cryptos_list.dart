import 'package:crypto_tracker/src/listCryptoCurrencys/widgets/pull_refresh.dart';
import 'package:flutter/material.dart';

import '../../listCryptoCurrencys/widgets/user_icon.dart';
import '../../design/custom_app_bar.dart';
import '../../util/constants.dart';
import '../bloc/cryptocurrencies_provider.dart';
import '../models/crypto_model.dart';
import '../widgets/loading_container.dart';

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
      builder:
          (BuildContext context, AsyncSnapshot<List<String>> listOfCryptoIds) {
        if (!listOfCryptoIds.hasData) {
          return LoadingContainer();
        }

        return Refresh(
          child: ListView.builder(
            itemCount: listOfCryptoIds.data.length,
            itemBuilder: (BuildContext context, int index) {
              bloc.fetchCryptoInfo(listOfCryptoIds.data[index]);

              return Text(listOfCryptoIds.data[index]);
            },
          ),
        );
      },
    );
  }
}
