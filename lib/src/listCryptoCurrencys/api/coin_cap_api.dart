import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'dart:async';

import '../models/crypto_model.dart';

final _rootUrl = 'https://api.coincap.io/v2';

class CoinCapApi {
  Client client = Client();

  Future<CryptoModel> fetchCryptoInfo(String cryptoSymbol) async {
    final response = await client.get('$_rootUrl/assets/$cryptoSymbol');
    final cryptoInfo = json.decode(response.body);

    return CryptoModel.fromJson(cryptoInfo);
  }
}
