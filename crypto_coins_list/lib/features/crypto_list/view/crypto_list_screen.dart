
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key,});
  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  
  List<CryptoCoin>? _cryptoCoinsList;
  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List'),
        leading:  Icon(Icons.arrow_back),
      ),

      body: (_cryptoCoinsList == null) 
      ? const Center(child: const CircularProgressIndicator())
      : ListView.separated(
          padding: const EdgeInsets.only(top:16),
          itemCount: _cryptoCoinsList!.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) {
            final coin = _cryptoCoinsList![i];
          return CryptoCointTile(coin: coin);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: ()async{
          await _loadCryptoCoins();
      }),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {
      
    });
  }
}

