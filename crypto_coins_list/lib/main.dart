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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies List'),
        leading:  Icon(Icons.arrow_back),
      ),

      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(),
        
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset('assets/svg/bitcoin_logo.svg', height: 50, width: 50,),
          title: Text(
            'Bitcoin',
            style: theme.textTheme.bodyMedium,
          ),

          subtitle: Text(
            '200000\$', 
          style: theme.textTheme.labelSmall,
          ),
        ),
      ),



    );
  }
}
