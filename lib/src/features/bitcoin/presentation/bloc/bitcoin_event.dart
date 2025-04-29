part of 'bitcoin_bloc.dart';

sealed class BitcoinEvent {}

/// Get coins from the API
final class GetCoinsEvent extends BitcoinEvent {
  final bool loadNextPage;
  GetCoinsEvent({this.loadNextPage = false});
}
