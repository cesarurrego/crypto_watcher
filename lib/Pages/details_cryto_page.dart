import 'package:crypto_watcher/model/model.dart';
import 'package:crypto_watcher/widgets/star_icon_widget.dart';
import 'package:flutter/material.dart';

class DestailCryptoPage extends StatelessWidget {
  const DestailCryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coin = ModalRoute.of(context)!.settings.arguments as CoinModel?;

    return Scaffold(
      appBar: AppBar(
        title: Text(coin?.name ?? ''),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageCrypto(imageCoin: coin?.image ?? ''),
              StarIconWidget(
                coin: coin,
                size: 80.0,
              )
            ],
          ),
          ListTile(title: Text('Market cap: ${coin?.marketCap.toString()}')),
          ListTile(
              title: Text('Market cap: ${coin?.priceChange24H.toString()}')),
          ListTile(title: Text('Market cap: ${coin?.lastUpdated.toString()}')),
        ],
      ),
    );
  }
}

class ImageCrypto extends StatelessWidget {
  final String imageCoin;

  const ImageCrypto({Key? key, required this.imageCoin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      margin: const EdgeInsets.only(top: 30),
      child: FadeInImage(
        placeholder: const AssetImage('assets/bros-coin.png'),
        image: NetworkImage(imageCoin),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
