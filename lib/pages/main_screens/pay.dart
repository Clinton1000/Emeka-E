import 'package:changecollect/pages/main_screens/UpTabs.dart';
import 'package:changecollect/pages/main_screens/textfieldCC.dart';
import 'package:flutter/material.dart';

class Pay extends StatefulWidget {
  static const String id = 'Pay';
  const Pay({Key? key}) : super(key: key);

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: const <Widget>[
                // ignore: prefer_const_constructors
              ],
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 48.0,
            ),
            Padding(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, TextFieldCC.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  // ignore: prefer_const_constructors
                  child: Text(
                    ' Receive Payment',
                  ),
                ),
              ),
            ),
            Padding(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, UpTabs.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Make Payment',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
