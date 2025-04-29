import 'dart:async';

import 'package:archonit_test/shared/failure.dart';
import 'package:archonit_test/shared/result.dart';
import 'package:archonit_test/src/app/constatnts/app_consts.dart';
import 'package:archonit_test/src/features/bitcoin/domain/entity/bitcoin_entity.dart';
import 'package:archonit_test/src/features/bitcoin/domain/repository/i_bitcoin_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bitcoin_event.dart';
part 'bitcoin_state.dart';

/// {@template bitcoin_bloc.class}
/// The Bloc for getting a list of coins
/// {@endtemplate}
class BitcoinBloc extends Bloc<BitcoinEvent, BitcoinState> {
  BitcoinBloc({
    required this.coinsRepository,
  }) : super(LoadinBitcoinState()) {
    on<BitcoinEvent>(
      (event, emitter) async {
        await switch (event) {
          GetCoinsEvent() => getNews(event, emitter),
        };
      },
    );
  }

  final IBitcoinRepository coinsRepository;

  Future<void> getNews(
    GetCoinsEvent event,
    Emitter<BitcoinState> emitter,
  ) async {
    try {
      /// Stores the offset of the last request on the site. When scrolling,
      /// the offset of the current state will be increased by kDefaultCoinsLimit
      final newOffset = event.loadNextPage && state is LoadedBitcoinState
          ? (state as LoadedBitcoinState).offset + AppConsts.kDefaultCoinsLimit
          : 0;
      final result = await coinsRepository.getItems(offset: newOffset);
      if (result is ResultOk) {
        /// all the received data is stored in the state in the general list
        emitter(
          LoadedBitcoinState(
            coins: (state.coins ?? [])..addAll(result.data ?? []),
            offset: newOffset,
          ),
        );
      } else {
        emitter(
          ErrorBitcoinState(
            coins: result.data ?? [],
            failure: result.error ??
                Failure(
                  description: 'Something went wrong',
                ),
          ),
        );
      }
    } on Object catch (e, _) {
      emitter(
        ErrorBitcoinState(
            coins: switch (state) {
              LoadedBitcoinState(:final coins) => coins,
              LoadinBitcoinState() => [],
              ErrorBitcoinState(:final coins) => coins,
            },
            failure: Failure(
              description: e.toString(),
            )),
      );
    }
  }
}
