import 'dart:math';

import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCurrenciesApp());
}

class CryptoCurrenciesApp extends StatelessWidget {
  const CryptoCurrenciesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciestList',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        primarySwatch: Colors.yellow,
        dividerColor: Colors.white24,
        appBarTheme: const AppBarTheme(
          backgroundColor:const Color.fromARGB(255,31, 31, 31),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200)
          ),
          
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),


        textTheme:  TextTheme(
          bodyMedium:  const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
            
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          )

        )
      ),
      routes: {
        '/':(context)=>CryptoListScreen(),
        '/coin': (context) =>CryptoCoinScreen(),
      },
    );
  }
}


class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');

    // if (args ==null){
    //   print('You must write args');
    //   return;
    // }

    // if (args is! String){
    //   log('You must provide String args' as num);
    //   return;
    // }

    coinName = args as String;
    setState(() {
      
    });
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...'),),
    );
  }
}