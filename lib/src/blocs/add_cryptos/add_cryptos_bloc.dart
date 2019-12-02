import 'dart:async';
import 'package:rxdart/rxdart.dart';

class AddCryptosBloc {
  final _cryptoCurrencyController = BehaviorSubject<String>();

  Function(String) get changeCryptocurrency =>
      _cryptoCurrencyController.sink.add;

  Stream<String> get cryptoCurrency => _cryptoCurrencyController.stream;

  submit() {
    final cryptoCurrency = _cryptoCurrencyController.value;

    print(cryptoCurrency);
  }

  dispose() {
    _cryptoCurrencyController.close();
  }
}
