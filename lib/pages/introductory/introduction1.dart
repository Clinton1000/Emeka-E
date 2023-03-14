import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Introduction1 extends StatelessWidget {
  const Introduction1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'No more worries about collecting your change when you pay with cash at the checkout, just scan it into your phone. ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 100.0),
                  child: Center(
                    child: Lottie.asset('images/checkout.json'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
