// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ConfigFolder extends StatelessWidget {
  final String iconimagepath;
  final String textpath;

  const ConfigFolder({
    Key? key,
    required this.iconimagepath,
    required this.textpath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10.0),
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            // ignore: prefer_const_literals_to_create_immutables
          ),
          child: Center(child: Image.asset(iconimagepath)),
        ),
        SizedBox(height: 10.0),
        Text(
          textpath,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
