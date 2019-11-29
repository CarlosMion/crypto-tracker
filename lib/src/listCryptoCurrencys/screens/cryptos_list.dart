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
    return StreamBuilder();
  }
}
