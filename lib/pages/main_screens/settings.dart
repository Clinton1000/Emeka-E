import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Manage Account')),
      ),
      body: const Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
