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
          Padding(
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
                                child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/8/8d/Antu_bitcoin-qt.svg'))))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
