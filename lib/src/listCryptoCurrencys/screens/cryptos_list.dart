import 'package:flutter/material.dart';

import '../../listCryptoCurrencys/widgets/user_icon.dart';
import '../../design/custom_app_bar.dart';
import '../../util/constants.dart';

class CryptosList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: APP_NAME,
        action: UserIcon(),
      ),
    );
  }
}
