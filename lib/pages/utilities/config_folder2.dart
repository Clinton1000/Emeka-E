// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ConfigFolder2 extends StatelessWidget {
  final String iconimagepath2;
  final String textpath2;
  final String textpath3;

  const ConfigFolder2({
    Key? key,
    required this.iconimagepath2,
    required this.textpath2,
    required this.textpath3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            height: 100.0,
            width: 100.0,
            child: Image.asset(iconimagepath2),
          ),
          SizedBox(width: 25.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textpath2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              SizedBox(height: 8.0),
              Text(
                textpath3,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 100,
            child: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
