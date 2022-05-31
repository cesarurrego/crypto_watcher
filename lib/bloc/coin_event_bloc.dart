part of 'coin_bloc.dart';

@immutable
abstract class CoinEvent {}

class LoadCoinsEvent extends CoinEvent {}

class SaveCoinEvent extends CoinEvent {
  final CoinModel? coin;

  SaveCoinEvent(this.coin);
}

class RemoveCoinEvent extends CoinEvent {}
