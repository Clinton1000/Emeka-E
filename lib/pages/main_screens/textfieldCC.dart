// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class TextFieldCC extends StatefulWidget {
  static const String id = 'textfieldCC';
  const TextFieldCC({Key? key}) : super(key: key);

  @override
  State<TextFieldCC> createState() => _TextFieldCCState();
}

class _TextFieldCCState extends State<TextFieldCC> {
  String qrcodeResponse = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 80.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xff01c3ff),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('qrcodeResponse'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 400.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff01c3ff), // background
                    foregroundColor: Colors.white, // foreground
                  ),
                  onPressed: () {
                    scancode();
                  },
                  child: Text('Scan Qrcode'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void scancode() async {
    String response = await FlutterBarcodeScanner.scanBarcode(
        '#ffffff', 'Cancel', true, ScanMode.QR);
    setState(() {
      qrcodeResponse = response;
    });
  }
}
