import 'dart:async';
import 'add_cryptos_validators.dart';
import 'package:rxdart/rxdart.dart';

class AddCryptosBloc extends Object with AddCryptosValidators {
  final _cryptoCurrencyController = BehaviorSubject<String>();

  Function(String) get changeCryptocurrency =>
      _cryptoCurrencyController.sink.add;

  Stream<String> get cryptoCurrency =>
      _cryptoCurrencyController.stream.transform(validateCryptocurrency);

  submit() {
    final cryptoCurrency = _cryptoCurrencyController.value;
  }

  dispose() {
    _cryptoCurrencyController.close();
  }
}
