import 'dart:convert';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';

import 'package:crypto_tracker/src/api/coin_cap_api.dart';
import 'package:crypto_tracker/src/api/models/crypto_model.dart';

void main() {
  test('FetchItem returns a item model', () async {
    final coinCapApi = CoinCapApi();
    coinCapApi.client = MockClient((request) async {
      final jsonMap = {'id': 'bitcoin'};

      return Response(json.encode(jsonMap), 200);
    });

    final CryptoModel cryptocurrency =
        await coinCapApi.fetchCryptoInfo('bitcoin');

    print(cryptocurrency);

    expect(cryptocurrency.id, 'bitcoin');
  });
}
