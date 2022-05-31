import 'package:crypto_watcher/Pages/details_cryto_page.dart';
import 'package:crypto_watcher/Pages/home_page.dart';
import 'package:crypto_watcher/Service/data_respository_service.dart';
import 'package:crypto_watcher/bloc/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataRepositoryService(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CoinBloc(context.read()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.cyan,
          ),
          home: const HomePage(),
          initialRoute: '',
          routes: {
            'homePage': (_) => const HomePage(),
            'detail': (_) => const DestailCryptoPage(),
          },
        ),
      ),
    );
  }
}
