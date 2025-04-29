import 'package:flutter/foundation.dart';

@immutable
class BitcoinEntity {
  final String symbol;
  final String price;

  const BitcoinEntity({required this.symbol, required this.price});

  @override
  int get hashCode => symbol.hashCode ^ price.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! BitcoinEntity) {
      return false;
    } else {
      return symbol == other.symbol && price == other.price;
    }
  }

  factory BitcoinEntity.fromJson(Map<String, dynamic> json) {
    return BitcoinEntity(symbol: json['symbol'], price: json['priceUsd']);
  }
}
