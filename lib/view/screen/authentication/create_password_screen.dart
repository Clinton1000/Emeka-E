import 'package:changecollect/utils/text_style.dart';
import 'package:changecollect/view/screen/authentication/account_name_screen.dart';
import 'package:changecollect/view/widget/back_button.dart';
import 'package:changecollect/view/widget/primary_button.dart';
import 'package:changecollect/view/widget/primary_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key key, this.email}) : super(key: key);

  final String email;

  TextEditingController confirmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _passwordformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _passwordformKey,
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
                    child: Text("Create a password", style: pBold33,)),
                SizedBox(height: 12,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("create a password for your new account", style: pLight18,),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(email, style: pBold14,),
                ),
                SizedBox(height: 20,),
                PrimaryInputField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  prefixIcon: CupertinoIcons.lock,
                  label: "New Password",
                ),
                SizedBox(height: 8,),
                PrimaryInputField(
                  controller: confirmController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  prefixIcon: CupertinoIcons.lock,
                  label: "Confirm Password...",
                ),
                SizedBox(height: 12,),
                PrimaryButton(
                  text: "Next",
                  onPress: () {
                    if (_passwordformKey.currentState.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AccountNameScreen()));
                      _passwordformKey.currentState.reset();
                    }

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
