import 'package:archonit_test/src/features/bitcoin/domain/entity/bitcoin_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class BitcoinDto {
  final List<BitcoinEntity> coins;

  const BitcoinDto({required this.coins});

  @override
  int get hashCode => coins.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! BitcoinDto) {
      return false;
    } else {
      return coins == other.coins;
    }
  }

  factory BitcoinDto.fromJson(Map<String, dynamic> json) {
    return BitcoinDto(
      coins: (json['data'] as List)
          .map((e) => BitcoinEntity.fromJson(e))
          .toList(),
    );
  }
}
