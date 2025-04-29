import 'package:archonit_test/src/app/di/app_scope.dart';
import 'package:archonit_test/src/app/di/di_scope_provider.dart';
import 'package:archonit_test/src/app/di/disposable_object.dart';
import 'package:archonit_test/src/features/bitcoin/data/repository/bitcoin_repository.dart';
import 'package:archonit_test/src/features/bitcoin/presentation/bloc/bitcoin_bloc.dart';
import 'package:flutter/material.dart';

class BitcoinScope implements IBitcoinScope {
  @override
  final BitcoinBloc bitcoinBloc;

  factory BitcoinScope.createScope(BuildContext context) {
    return BitcoinScope._(
      bitcoinBloc: BitcoinBloc(
        coinsRepository: BitcoinRepository(
          dio: DiScopeProvider.of<IAppScope>(context).dio,
        ),
      ),
    );
  }

  BitcoinScope._({required this.bitcoinBloc});

  @override
  Future<void> dispose() async {
    await bitcoinBloc.close();
  }
}

abstract interface class IBitcoinScope implements DisposableObject {
  BitcoinBloc get bitcoinBloc;
}
