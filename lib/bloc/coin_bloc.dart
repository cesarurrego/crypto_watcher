import 'package:crypto_watcher/Service/data_respository_service.dart';
import 'package:crypto_watcher/model/model.dart';
import 'package:crypto_watcher/preference/utils_preference.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coin_event_bloc.dart';
part 'coin_state_bloc.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final DataRepositoryService _dataService;

  CoinBloc(this._dataService) : super(CoinInitState()) {
    blocEvents();
  }

  blocEvents() {
    on<LoadCoinsEvent>((_loadCoins));
    on<SaveCoinEvent>((_saveCoin));
  }

  _loadCoins(event, emit) async {
    emit(LoadingCoinsState());
    try {
      final coins = await _dataService.getProjectsData();
      final savedCoins = await _getSavedCoins();
      emit(CoinInitState(
        coins: coins,
        saveCoins: savedCoins,
      ));
    } catch (e) {
      emit(ErrorCoinsState());
    }
  }

  _saveCoin(event, emit) async {
    try {
      final currentState = state as CoinInitState;
      emit(LoadingCoinsState());
      await _addOrDeleteFromPreferences(event.coin);
      final savedCoins = await _getSavedCoins();
      emit(CoinInitState(coins: currentState.coins, saveCoins: savedCoins));
    } catch (e) {
      emit(ErrorCoinsState());
    }
  }

  _addOrDeleteFromPreferences(CoinModel coin) async {
    final List<String>? coinList =
        await PreferenceUtils.getStringList('listCoin');
    if (coinList != null) {
      bool existCoin = _validateCoinExist(coinList, coin.id ?? '');
      if (!existCoin) {
        coinList.add(coin.id ?? '');
      } else {
        coinList.remove(coin.id);
      }
      await PreferenceUtils.setStringList('listCoin', coinList);
    } else {
      await PreferenceUtils.setStringList('listCoin', [coin.id ?? '']);
    }
  }

  Future<bool> validateIfExistOnSaved(String id) async {
    final sharedCoins = await PreferenceUtils.getStringList('listCoin') ?? [];
    if (sharedCoins.isNotEmpty) {
      return _validateCoinExist(sharedCoins, id);
    }
    return false;
  }

  bool _validateCoinExist(List<String> coinList, value) {
    final findValue =
        coinList.firstWhere((element) => element == value, orElse: () => '');
    bool exist = findValue.isNotEmpty;
    return exist;
  }

  Future<List<CoinModel>> _getSavedCoins() async {
    final sharedCoins = await PreferenceUtils.getStringList('listCoin') ?? [];
    final List<CoinModel> savedCoins = [];
    for (var coin in sharedCoins) {
      final dataCoin = _getCoinModelById(coin);
      if (dataCoin != null) {
        savedCoins.add(dataCoin);
      }
    }
    return savedCoins;
  }

  CoinModel? _getCoinModelById(String id) {
    return _dataService.getCoinById(id);
  }
}
