// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:changecollect/pages/main_screens/textfieldGC.dart';
import 'package:flutter/material.dart';
import 'fiat.dart';
import 'crypto.dart';

class UpTabs extends StatefulWidget {
  static const String id = 'uptabs';

  const UpTabs({Key? key}) : super(key: key);

  @override
  State<UpTabs> createState() => _UpTabsState();
}

class _UpTabsState extends State<UpTabs> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3964ff),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.account_balance,
                ),
                text: 'FIAT',
              ),
              Tab(
                icon: Icon(
                  Icons.currency_bitcoin,
                ),
                text: 'CRYPTO',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, TextFieldGC.id);
                },
                child: Fiat()),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, TextFieldGC.id);
                },
                child: Crypto()),
          ],
        ),
      ),
    );
  }
}
