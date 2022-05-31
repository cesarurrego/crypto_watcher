import 'package:crypto_watcher/bloc/coin_bloc.dart';
import 'package:crypto_watcher/model/model.dart';
import 'package:crypto_watcher/widgets/items_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  late bool isSelect;

  @override
  void initState() {
    isSelect = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRYPTO'),
      ),
      body: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state is LoadingCoinsState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CoinInitState) {
            final coinList = state.coins;
            return ListView.builder(
              itemCount: coinList?.length,
              itemBuilder: (BuildContext context, int index) {
                final CoinModel? coin = coinList?[index];
                return ItemList(coin: coin);
              },
            );
          }
          return const Center(
            child: Text('No coin data'),
          );
        },
      ),
    );
  }
}
