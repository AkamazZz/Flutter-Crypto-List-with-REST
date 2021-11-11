import 'package:first_project/coinModel.dart';
import 'package:flutter/material.dart';

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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          CoinCard(
            name: 'yes',
            symbol: 'y',
            imageUrl: 'kim biled',
            price: 1000,
            change: 10,
            changePercentage: -10,
          )
        ],
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  String name;
  String symbol;
  String imageUrl;
  num price;
  num change;
  num changePercentage;
  CoinCard(
      {required this.name,
      required this.symbol,
      required this.imageUrl,
      required this.price,
      required this.change,
      required this.changePercentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xff202020),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 75,
                  width: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(imageUrl),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(symbol,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 20,
                      )),
                ],
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(price.toDouble().toString(),
                              style: TextStyle(
                                color: change.toDouble() < 0
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            change.toDouble() < 0
                                ? '-' + change.toDouble().toString() + '%'
                                : '+' + change.toDouble().toString() + '%',
                            style: TextStyle(
                              color: change.toDouble() < 0
                                  ? Colors.red
                                  : Colors.green,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                              changePercentage.toDouble() < 0
                                  ? '-' +
                                      changePercentage.toDouble().toString() +
                                      '%'
                                  : '+' +
                                      changePercentage.toDouble().toString() +
                                      '%',
                              style: TextStyle(
                                color: changePercentage.toDouble() < 0
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 17,
                              ))
                        ],
                      )))
            ],
          )),
    );
  }
}
