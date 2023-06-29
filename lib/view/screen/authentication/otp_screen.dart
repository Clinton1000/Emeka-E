import 'package:changecollect/utils/images.dart';
import 'package:changecollect/utils/text_style.dart';
import 'package:changecollect/view/screen/authentication/create_password_screen.dart';
import 'package:changecollect/view/widget/back_button.dart';
import 'package:changecollect/view/widget/primary_button.dart';
import 'package:changecollect/view/widget/primary_input_field.dart';
import 'package:changecollect/view/widget/social_login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key key, this.email}) : super(key: key);

  final String email;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                   Align(
                      alignment: Alignment.centerLeft,
                      child: CCBackButton(
                        onPress: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  SizedBox(height: Get.size.height / 8,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Confirm your email address", style: pBold33,)),
                  SizedBox(height: 12,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("We just sent you an email with code to ", style: pLight18,),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.email, style: pBold14,),
                  ),
                  SizedBox(height: 20,),
                  PrimaryInputField(
                    controller: otpController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Code is required';
                      }
                      return null;
                    },
                    //prefixIcon: CupertinoIcons.,
                    label: "Code from emaill address",
                  ),
                  SizedBox(height: 12,),
                  PrimaryButton(
                    text: "Next",
                    onPress: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewPasswordScreen(
                        email: widget.email,
                      )));
                    },
                  ),
                  //Spacer(),
                  SizedBox(height: Get.size.height / 3.5,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
