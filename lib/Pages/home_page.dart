import 'package:crypto_watcher/Pages/pages.dart';
import 'package:crypto_watcher/bloc/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> _widgetsPages = <Widget>[
    const CryptoPage(),
    const WatchListPage(),
  ];

  @override
  void initState() {
    BlocProvider.of<CoinBloc>(context).add(LoadCoinsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetsPages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan,
        unselectedIconTheme: const IconThemeData(color: Colors.black87),
        items: const [
          BottomNavigationBarItem(
            label: 'coins',
            icon: Icon(Icons.currency_bitcoin),
          ),
          BottomNavigationBarItem(
            label: 'watchlist',
            icon: Icon(Icons.remove_red_eye),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
