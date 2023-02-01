import 'package:changecollect/pages/utilities/fiat_config.dart';
import 'package:flutter/material.dart';

class Fiat extends StatefulWidget {
  static const String id = 'fiat';

  // List fiat = [
  //   'fiat 1',
  //   'fiat 2',
  //   'fiat 3',
  //   'fiat 4',
  //   'fiat 5',
  //   'fiat 6',
  //   'fiat 7',
  //   'fiat 8',
  // ];

  Fiat({Key? key}) : super(key: key);

  @override
  State<Fiat> createState() => _FiatState();
}

class _FiatState extends State<Fiat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                FiatConfig(
                    symbol: 'images/naira.png',
                    abbreviation: 'NGN',
                    name: 'Nigerian Naira'),
                FiatConfig(
                    symbol: 'images/ghana.jpg',
                    abbreviation: 'GHS',
                    name: 'Ghanian Cedis'),
                FiatConfig(
                    symbol: 'images/southy Rand.jpg',
                    abbreviation: 'ZAR',
                    name: 'South African Rand'),
                FiatConfig(
                    symbol: 'images/rwanda.webp',
                    abbreviation: 'RWF',
                    name: 'Rwandan Franc'),
                FiatConfig(
                    symbol: 'images/dirham.webp',
                    abbreviation: 'AED',
                    name: 'United Arab Dirhams'),
                FiatConfig(
                    symbol: 'images/usd.png',
                    abbreviation: 'USD',
                    name: 'United States Dollars'),
                FiatConfig(
                    symbol: 'images/euro.jpg',
                    abbreviation: 'EURO',
                    name: 'Euros'),
                FiatConfig(
                    symbol: 'images/pounds.jpg',
                    abbreviation: 'GBP',
                    name: 'Pound Sterling'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
