// To parse this JSON data, do
//
//     final coinModel = coinModelFromMap(jsonString);

import 'dart:convert';

List<CoinModel> coinModelFromJson(String str) =>
    List<CoinModel>.from(json.decode(str).map((x) => CoinModel.fromJson(x)));

String coinModelToJson(List<CoinModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoinModel {
  CoinModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.lastUpdated,
  });

  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  int? marketCap;
  int? marketCapRank;
  int? fullyDilutedValuation;
  double? totalVolume;
  double? high24H;
  double? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  double? marketCapChange24H;
  double? marketCapChangePercentage24H;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  double? ath;
  double? athChangePercentage;
  DateTime? athDate;
  double? atl;
  double? atlChangePercentage;
  DateTime? atlDate;
  DateTime? lastUpdated;

  factory CoinModel.fromJson(String str) => CoinModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoinModel.fromMap(Map<String, dynamic> json) => CoinModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"]?.toDouble() ?? 0.0,
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: json["fully_diluted_valuation"],
        totalVolume: json["total_volume"]?.toDouble() ?? 0.0,
        high24H: json["high_24h"]?.toDouble() ?? 0.0,
        low24H: json["low_24h"]?.toDouble() ?? 0.0,
        priceChange24H: json["price_change_24h"]?.toDouble() ?? 0.0,
        priceChangePercentage24H:
            json["price_change_percentage_24h"]?.toDouble() ?? 0.0,
        marketCapChange24H: json["market_cap_change_24h"]?.toDouble() ?? 0.0,
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"]?.toDouble() ?? 0.0,
        circulatingSupply: json["circulating_supply"]?.toDouble() ?? 0.0,
        totalSupply: json["total_supply"]?.toDouble() ?? 0.0,
        maxSupply: json["max_supply"]?.toDouble() ?? 0.0,
        ath: json["ath"]?.toDouble() ?? 0.0,
        athChangePercentage: json["ath_change_percentage"]?.toDouble() ?? 0.0,
        athDate: DateTime.parse(json["ath_date"]),
        atl: json["atl"]?.toDouble() ?? 0.0,
        atlChangePercentage: json["atl_change_percentage"]?.toDouble() ?? 0.0,
        atlDate: DateTime.parse(json["atl_date"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap": marketCap,
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation": fullyDilutedValuation,
        "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "ath": ath,
        "ath_change_percentage": athChangePercentage,
        "ath_date": athDate?.toIso8601String(),
        "atl": atl,
        "atl_change_percentage": atlChangePercentage,
        "atl_date": atlDate?.toIso8601String(),
        "last_updated": lastUpdated?.toIso8601String(),
      };
}

class Roi {
  Roi({
    this.times,
    this.currency,
    this.percentage,
  });

  double? times;
  Currency? currency;
  double? percentage;

  factory Roi.fromJson(String str) => Roi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Roi.fromMap(Map<String, dynamic> json) => Roi(
        times: json["times"].toDouble(),
        currency: currencyValues.map?[json["currency"]],
        percentage: json["percentage"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "times": times,
        "currency": currencyValues.reverse?[currency],
        "percentage": percentage,
      };
}

enum Currency { btc, usd, eth }

final currencyValues = EnumValues({
  "btc": Currency.btc,
  "eth": Currency.eth,
  "usd": Currency.usd,
});

class SparklineIn7D {
  SparklineIn7D({
    this.price,
  });

  List<double>? price;

  factory SparklineIn7D.fromJson(String str) =>
      SparklineIn7D.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SparklineIn7D.fromMap(Map<String, dynamic> json) => SparklineIn7D(
        price: List<double>.from(json["price"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "price": List<dynamic>.from(price?.map((x) => x) ?? []),
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
