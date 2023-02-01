import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Introduction2 extends StatelessWidget {
  const Introduction2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Lottie.asset('images/qrcode.json'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
