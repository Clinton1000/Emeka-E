// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:changecollect/pages/main_screens/textfieldCC.dart';
import 'package:changecollect/pages/main_screens/UpTabs.dart';
import 'package:changecollect/pages/main_screens/fund.dart';
import 'package:changecollect/pages/main_screens/pay.dart';
import 'package:changecollect/pages/utilities/config_folder.dart';
import 'package:changecollect/pages/utilities/config_folder2.dart';
import 'package:flutter/material.dart';

late Size mq;

class Homepage extends StatefulWidget {
  static const String id = 'Home_page';

  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          radius: 15.0,
                          backgroundImage: AssetImage('images/CC Icon2i.jpg'),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          width: 360.0,
                          height: 190.0,
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Color(0xff3964ff),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Expanded(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Balance',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(25.0),
                                          child: Text(
                                            '\$40,000'.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        color: Color(0xff3964ff),
                        icon: Icon(Icons.add_circle),
                        tooltip: 'Fund',
                        onPressed: () {
                          Navigator.pushNamed(context, FundAccount.id);
                        },
                      ),
                      Text(
                        'Fund Account',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, TextFieldCC.id);
                        },
                        child: ConfigFolder(
                            iconimagepath: 'images/pay3.jpg',
                            textpath: 'Collect Change'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, UpTabs.id);
                        },
                        child: ConfigFolder(
                            iconimagepath: 'images/pay2.jpg',
                            textpath: 'Give Change'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Pay.id);
                        },
                        child: ConfigFolder(
                            iconimagepath: 'images/pay.jpg', textpath: 'Pay'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ConfigFolder2(
                            iconimagepath2: 'images/statistics.jpg',
                            textpath2: 'Statistics',
                            textpath3: 'Payments and Income'),
                        ConfigFolder2(
                            iconimagepath2: 'images/History.jpg',
                            textpath2: 'Transactions',
                            textpath3: 'Transaction History')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
