import 'package:changecollect/utils/images.dart';
import 'package:changecollect/utils/text_style.dart';
import 'package:changecollect/view/screen/authentication/login_screen.dart';
import 'package:changecollect/view/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SizedBox(
            height: Get.size.height,
            width: Get.size.width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    height: Get.size.height / 2.2,
                    width: Get.size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), // Adjust the value to set the desired border radius
                      image: DecorationImage(
                        image: AssetImage(DefaultImages.splashImg), // Replace with your image path
                        fit: BoxFit.contain, // Adjust the fit property based on your requirements
                      ),
                    ),
                  ),
                  Text("Collect and Give Change", style: pBold44,),
                  SizedBox(height: 16,),
                  Text("Give & Receive change in NGN, USD, BTC, ETH "
                      "and other currencies with Change Collect", style: pLight18,),
                  Spacer(),
                  PrimaryButton(
                    text: "Get Started",
                    onPress: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
                  )

                ],
              ),
            ),
          )
      ),
    );
  }
}
