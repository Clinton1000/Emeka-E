import 'package:changecollect/utils/text_style.dart';
import 'package:changecollect/view/screen/authentication/create_wallet_pin.dart';
import 'package:changecollect/view/widget/back_button.dart';
import 'package:changecollect/view/widget/primary_button.dart';
import 'package:changecollect/view/widget/primary_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountNameScreen extends StatelessWidget {
  AccountNameScreen({Key key,}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  final nameformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: nameformKey,
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
                    child: Text("How can we call you?", style: pBold33,)),
                SizedBox(height: 12,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Create a name for your account", style: pLight18,),
                ),
                SizedBox(height: 20,),
                PrimaryInputField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                  prefixIcon: CupertinoIcons.person,
                  label: "Username",
                ),

                SizedBox(height: 12,),
                PrimaryButton(
                  text: "Next",
                  onPress: () {
                    if (nameformKey.currentState.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewWalletPinScreen()));
                      nameformKey.currentState.reset();
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
