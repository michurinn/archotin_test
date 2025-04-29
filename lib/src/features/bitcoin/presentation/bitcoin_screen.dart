import 'package:archonit_test/src/app/di/di_scope_provider.dart';
import 'package:archonit_test/src/app/extensions/colored_bitcoin_entity.dart';
import 'package:archonit_test/src/features/bitcoin/di/bitcoin_scope.dart';
import 'package:archonit_test/src/features/bitcoin/presentation/bloc/bitcoin_bloc.dart';
import 'package:archonit_test/src/features/bitcoin/presentation/widget/coin_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BitcoinScreen extends StatefulWidget {
  const BitcoinScreen({super.key});

  @override
  State<BitcoinScreen> createState() => _BitcoinScreenState();
}

class _BitcoinScreenState extends State<BitcoinScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    DiScopeProvider.of<IBitcoinScope>(context).bitcoinBloc.add(
          GetCoinsEvent(),
        );
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent) {
          DiScopeProvider.of<IBitcoinScope>(context).bitcoinBloc.add(
                GetCoinsEvent(loadNextPage: true),
              );
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<BitcoinBloc, BitcoinState>(
          bloc: DiScopeProvider.of<IBitcoinScope>(context).bitcoinBloc,
          listener: (context, state) => state is ErrorBitcoinState
              ? ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.failure.description),
                  ),
                )
              : null,
          builder: (context, state) {
            return switch (state) {
              LoadinBitcoinState() => Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(
                      const Size(80, 80),
                    ),
                    child: const CircularProgressIndicator.adaptive(),
                  ),
                ),
              ErrorBitcoinState(:final coins) ||
              LoadedBitcoinState(:final coins) =>
                ListView.separated(
                    controller: _scrollController,
                    itemBuilder: (context, index) => ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            const Size.fromHeight(84),
                          ),
                          child: CoinCardWidget(
                            key: ObjectKey(coins[index]),
                            color: (coins[index] as ColoredBitcoinEntity)
                                .hashColor,
                            coin: coins[index],
                          ),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                    itemCount: coins.length)
            };
          },
        ),
      ),
    );
  }
}
