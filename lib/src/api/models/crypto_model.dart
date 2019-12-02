class CryptoModel {
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final String supply;
  final String maxSupply;
  final String marketCapUsd;
  final String volumeUsd24Hr;
  final String priceUsd;
  final String changePercent24Hr;
  final String vwap24Hr;
  final int timestamp;

  CryptoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        rank = json['rank'],
        symbol = json['symbol'],
        name = json['name'],
        supply = json['supply'],
        maxSupply = json['maxSupply'],
        marketCapUsd = json['marketCapUsd'],
        volumeUsd24Hr = json['volumeUsd24Hr'],
        priceUsd = json['priceUsd'],
        changePercent24Hr = json['changePercent24Hr'],
        vwap24Hr = json['vwap24Hr'],
        timestamp = json['timestamp'];
}
