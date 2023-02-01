// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TextFieldGC extends StatefulWidget {
  static const String id = 'TextFieldGC';
  TextFieldGC({Key? key}) : super(key: key);

  @override
  State<TextFieldGC> createState() => _TextFieldGCState();
}

class _TextFieldGCState extends State<TextFieldGC> {
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: TextField(
                    controller: amountController,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.account_balance,
                        color: Colors.white,
                      ),
                      hintText: 'Enter Amount',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          amountController.text = '';
                        });
                      } else {
                        setState(() {
                          amountController = value as TextEditingController;
                        });
                      }
                    },
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan, // background
                    foregroundColor: Colors.white, // foreground
                  ),
                  onPressed: () {
                    setState(() {
                      amountController.text;
                    });
                  },
                  child: Text('Generate'),
                ),

                SizedBox(
                  height: 70.0,
                ),
                //Qr code widget
                BarcodeWidget(
                    data: amountController.text.trim(),
                    barcode: Barcode.qrCode()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
