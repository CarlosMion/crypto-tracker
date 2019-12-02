import 'package:rxdart/rxdart.dart';

import '../../api/models/crypto_model.dart';
import '../../api/coin_cap_api.dart';
import '../../util/async_storage.dart';

class CryptocurrenciesBloc {
  final _coinCapApi = CoinCapApi();
  final _listCryptos = BehaviorSubject<List<String>>();
  final _cryptosOutput = BehaviorSubject<Map<String, Future<CryptoModel>>>();
  final _cryptosFetcher = PublishSubject<String>();

  // Getters to Streams
  Observable<List<String>> get listCryptos => _listCryptos.stream;
  Observable<Map<String, Future<CryptoModel>>> get cryptos =>
      _cryptosOutput.stream;

  //Getters to Sinks
  Function(String) get fetchCryptoInfo => _cryptosFetcher.sink.add;

  CryptocurrenciesBloc() {
    _cryptosFetcher.stream
        .transform(_cryptosTransformer())
        .pipe(_cryptosOutput);
  }

  fetchCryptos() async {
    final List<String> cryptos = await AsyncStorage.getCryptocurrencies();

    print(cryptos);

    return cryptos != null ? _listCryptos.sink.add(cryptos) : null;
  }

  _cryptosTransformer() {
    // This method is for avoiding the StreamBuilders on the screen to be empty everytime a new value comes trhough the stream
    return ScanStreamTransformer(
      (Map<String, Future<CryptoModel>> cache, String id, _) {
        cache[id] = _coinCapApi.fetchCryptoInfo(id);
        return cache;
      },
      <String, Future<CryptoModel>>{}, // initial value
    );
  }

  dispose() {
    _listCryptos.close();
    _cryptosOutput.close();
    _cryptosFetcher.close();
  }
}
