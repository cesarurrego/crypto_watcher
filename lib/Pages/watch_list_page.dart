import 'package:crypto_watcher/bloc/coin_bloc.dart';
import 'package:crypto_watcher/widgets/items_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WHATCHER'),
      ),
      body: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state is CoinInitState) {
            final coins = state.saveCoins ?? [];
            return ListView.builder(
              itemCount: coins.length,
              itemBuilder: (_, i) {
                return ItemList(coin: coins[i]);
              },
            );
          } else {
            return const Center(
              child: Text('no select coin'),
            );
          }
        },
      ),
    );
  }
}
