import 'dart:async';

import 'package:rxdart/rxdart.dart';

class AddCryptosBloc {
  final _cryptoCurrencyController = BehaviorSubject<String>();

  Function(String) get changeCryptocurrency =>
      _cryptoCurrencyController.sink.add;

  Stream<String> get cryptoCurrency => _cryptoCurrencyController.stream;

  dispose() {
    _cryptoCurrencyController.close();
  }
}
