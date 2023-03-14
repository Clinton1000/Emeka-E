import 'package:flutter/material.dart';

class Withdrawal extends StatefulWidget {
  static const String id = 'Withdrawal';
  const Withdrawal({Key? key}) : super(key: key);

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  final _bankNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _bankNameController.dispose();
    _accountNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  'The account holder\'s name must match the one used for personal '
                  'verification at Changecollect, or the transaction will fail.'),
            ),
            SizedBox(height: 100),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: _bankNameController,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Select Bank',
                    hintStyle: TextStyle(color: Colors.grey[500])),
                obscureText: false,
              ),
            ),

            const SizedBox(height: 10),

            // account number textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: _accountNumberController,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Enter Account Number',
                    hintStyle: TextStyle(color: Colors.grey[500])),
                obscureText: true,
              ),
            ),

            const SizedBox(height: 10),

            // confirm password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: _emailController,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: Colors.grey[500])),
                obscureText: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
