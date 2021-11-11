import 'package:flutter/material.dart';

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
