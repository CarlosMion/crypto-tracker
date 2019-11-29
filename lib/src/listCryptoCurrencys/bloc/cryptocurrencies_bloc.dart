import 'package:rxdart/rxdart.dart';;
import '../models/crypto_model.dart';
import '../api/coin_cap_api.dart';

class CryptocurrenciesBloc {
  final _coinCapApi = CoinCapApi();

  final _cryptosOutput = BehaviorSubject<Map<int, Future<CryptoModel>>>();
  final _cryptosFetcher = PublishSubject<String>();

  // Getters to Streams
  Observable<Map<int, Future<CryptoModel>>> get items => _cryptosOutput.stream;

  //Getters to Sinks
  Function(String) get fetchCryptoInfo => _cryptosFetcher.sink.add;

  CryptocurrenciesBloc() {
    _cryptosFetcher.stream.transform(_cryptosTransformer()).pipe(_cryptosOutput);
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
    _cryptosOutput.close();
    _cryptosFetcher.close();
  }
}
