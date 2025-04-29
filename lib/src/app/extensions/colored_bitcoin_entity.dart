import 'dart:ui';

import 'package:archonit_test/src/app/extensions/get_random_color.dart';
import 'package:archonit_test/src/features/bitcoin/domain/entity/bitcoin_entity.dart';

extension type ColoredBitcoinEntity(BitcoinEntity coin) {
  Color get color => generateColor();
  Color get hashColor => Color(coin.hashCode);
}
