import 'package:shared_preferences/shared_preferences.dart';

class AsyncStorage {
  static addCryptoCurrency(String cryptoId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> savedCryptocurrencies =
        prefs.getStringList('savedCryptocurrencies') ?? [];
    savedCryptocurrencies.add(cryptoId);

    prefs.setStringList('savedCryptocurrencies', savedCryptocurrencies);
  }

  static removeCryptoCurrency(String cryptoId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> savedCryptocurrencies =
        prefs.getStringList('savedCryptocurrencies');
    savedCryptocurrencies.remove(cryptoId);

    prefs.setStringList('savedCryptocurrencies', savedCryptocurrencies);
  }

  static Future<List<String>> getCryptocurrencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> savedCryptocurrencies =
        prefs.getStringList('savedCryptocurrencies');

    return savedCryptocurrencies;
  }
}
