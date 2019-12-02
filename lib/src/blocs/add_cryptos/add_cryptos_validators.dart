import 'dart:async';

class AddCryptosValidators {
  final validateCryptocurrency = StreamTransformer<String, String>.fromHandlers(
      handleData: (cryptoCurrency, sink) {
    if (cryptoCurrency.length < 3) {
      sink.add(cryptoCurrency);
    } else {
      sink.addError(
          'It was not possible to find the given cryptocurrency on our servers');
    }
  });
}
