import 'package:changecollect/utils/text_style.dart';
import 'package:changecollect/view/screen/dashboard/dashboard_screen.dart';
import 'package:changecollect/view/widget/primary_button.dart';
import 'package:changecollect/view/widget/secondary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnableBiometricScreen extends StatefulWidget {
  EnableBiometricScreen({Key key,}) : super(key: key);

  @override
  State<EnableBiometricScreen> createState() => _EnableBiometricScreenState();
}

class _EnableBiometricScreenState extends State<EnableBiometricScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    width: Get.size.width,
                    height: Get.size.height / 2.5,
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        width: Get.size.width / 5,
                        height: Get.size.height / 5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      child: Icon(
                        Icons.fingerprint_outlined,
                        size: 80,
                        color: const Color(0xFF5C5CFF),
                      ),
                    ),
                  ),

                  SizedBox(height: Get.size.height / 10,),
                  Text("Create new Wallet PIN", style: pBold33,),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("You will need to enter this pin before you can access you wallet", style: pLight16,
                      textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 30,),
                  PrimaryButton(
                    text: "Allow access to Touch ID",
                    onPress: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OTPScreen(email: emailString)),
                        );*/
                    },
                  ),
                  SizedBox(height: 10,),
                  SecondaryButton(
                    text: "No, thank you",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DashboardScreen()),
                        );
                    },
                  ),


                ],
              ),
            ),
          ),
      ),
    );
  }
}
