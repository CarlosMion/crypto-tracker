import 'dart:convert';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';

import 'package:crypto_tracker/src/api/coin_cap_api.dart';

void main() {
  test('fetchCryptoInfo returns a cryptoModel', () async {
    final coinCapApi = CoinCapApi();
    coinCapApi.client = MockClient((request) async {
      final jsonMap = {
        'data': {'id': 'bitcoin'}
      };

      return Response(json.encode(jsonMap), 200);
    });

    final cryptocurrency = await coinCapApi.fetchCryptoInfo('bitcoin');

    expect(cryptocurrency.id, 'bitcoin');
  });
}
