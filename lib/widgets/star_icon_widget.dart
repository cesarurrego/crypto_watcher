import 'package:crypto_watcher/bloc/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_watcher/model/model.dart';

class StarIconWidget extends StatefulWidget {
  final CoinModel? coin;
  final double? size;

  const StarIconWidget({
    Key? key,
    required this.coin,
    this.size,
  }) : super(key: key);

  @override
  State<StarIconWidget> createState() => _StarIconWidgetState();
}

class _StarIconWidgetState extends State<StarIconWidget> {
  late bool isSelect;

  @override
  void initState() {
    isSelect = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<CoinBloc>(context)
          .validateIfExistOnSaved(widget.coin?.id ?? ''),
      builder: (context, AsyncSnapshot<bool> snapshot) {
        isSelect = snapshot.data ?? false;
        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            isSelect = !isSelect;
            BlocProvider.of<CoinBloc>(context).add(SaveCoinEvent(widget.coin));
            setState(() {});
          },
          icon: Icon(
            isSelect ? Icons.star : Icons.star_border_outlined,
            color: Colors.cyan,
          ),
        );
      },
    );
  }
}
