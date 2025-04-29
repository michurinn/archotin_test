import 'package:archonit_test/src/app/constatnts/app_consts.dart';
import 'package:archonit_test/src/features/bitcoin/domain/entity/bitcoin_entity.dart';

extension HasNextPageExtension on List<BitcoinEntity>? {
  bool hasNextPage() => this != null && this!.isNotEmpty
      ? this!.length >= AppConsts.kDefaultCoinsLimit
      : false;
}
