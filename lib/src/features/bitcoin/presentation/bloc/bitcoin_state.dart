part of 'bitcoin_bloc.dart';

@immutable
sealed class BitcoinState {
  abstract final List<BitcoinEntity>? coins;
}

@immutable
final class LoadinBitcoinState extends BitcoinState {
  @override
  List<BitcoinEntity>? get coins => null;
}

@immutable
final class LoadedBitcoinState extends BitcoinState {
  @override
  final List<BitcoinEntity> coins;

  final int offset;

  @override
  int get hashCode => coins.hashCode ^ offset.hashCode;

  LoadedBitcoinState({
    this.coins = const [],
    this.offset = 0,
  });

  @override
  bool operator ==(covariant BitcoinState other) {
    if (other is! LoadedBitcoinState) {
      return false;
    }

    return other.coins == coins && other.offset == offset;
  }

  LoadedBitcoinState copyWith({
    List<BitcoinEntity>? coins,
  }) {
    return LoadedBitcoinState(
      coins: coins ?? this.coins,
    );
  }
}

final class ErrorBitcoinState extends BitcoinState {
  @override
  final List<BitcoinEntity> coins;

  final Failure failure;

  @override
  int get hashCode => coins.hashCode ^ failure.hashCode;

  ErrorBitcoinState({required this.coins, required this.failure});

  @override
  bool operator ==(covariant BitcoinState other) {
    if (other is! ErrorBitcoinState) {
      return false;
    }

    return other.coins == coins && other.failure == failure;
  }
}
