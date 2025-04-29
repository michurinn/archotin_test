import 'package:archonit_test/shared/failure.dart';
import 'package:archonit_test/shared/request_operation.dart';
import 'package:archonit_test/shared/result.dart';
import 'package:archonit_test/src/app/network/urls.dart';
import 'package:archonit_test/src/features/bitcoin/domain/dto/bitcoin_dto.dart';
import 'package:archonit_test/src/features/bitcoin/domain/entity/bitcoin_entity.dart';
import 'package:archonit_test/src/features/bitcoin/domain/repository/i_bitcoin_repository.dart';
import 'package:dio/dio.dart';

class BitcoinRepository implements IBitcoinRepository {
  final Dio dio;

  BitcoinRepository({required this.dio});
  @override
  RequestOperation<List<BitcoinEntity>> getItems({
    int limit = 15,
    int offset = 0,
  }) async {
    try {
      final response = await dio.get(Urls.getAssets, queryParameters: {
        'limit': limit,
        'offset': offset,
        'apiKey': Urls.apiKey,
      });
      return Result.ok(
        BitcoinDto.fromJson(response.data).coins,
      );
    } on Object catch (e) {
      return Result.error(
        Failure(
          description: e.toString(),
        ),
      );
    }
  }
}
