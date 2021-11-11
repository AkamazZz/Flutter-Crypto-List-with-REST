import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'coinCard.dart';
import 'coinModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            coinList.add(Coin.fromJson(values[i]));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1B1B25),
        appBar: AppBar(
          backgroundColor: const Color(0xff1F1F2C),
          title: Text(
            'CryptoLibrary',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return CoinCard(
                name: coinList[index].name,
                symbol: coinList[index].symbol,
                imageUrl: coinList[index].imageUrl,
                price: coinList[index].price.toDouble(),
                change: coinList[index].change.toDouble(),
                changePercentage: coinList[index].changePercentage.toDouble());
          },
          itemCount: coinList.length,
        ));
  }
}
