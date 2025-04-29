import 'package:archonit_test/shared/request_operation.dart';
import 'package:archonit_test/src/features/bitcoin/domain/entity/bitcoin_entity.dart';

abstract interface class IBitcoinRepository {
  RequestOperation<List<BitcoinEntity>> getItems({
    int limit = 15,
    int offset = 0,
  });
}
