import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class Introduction3 extends StatelessWidget {
  const Introduction3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(100.0),
                color: Colors.white,
                child: Lottie.asset('images/crypto-payment-flow.json'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
