import 'package:changecollect/utils/text_style.dart';
import 'package:changecollect/view/screen/authentication/enable_biometric_screen.dart';
import 'package:changecollect/view/widget/back_button.dart';
import 'package:changecollect/view/widget/pin_input_field.dart';
import 'package:changecollect/view/widget/pin_keyboard.dart';
import 'package:changecollect/view/widget/primary_button.dart';
import 'package:changecollect/view/widget/primary_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class NewWalletPinScreen extends StatefulWidget {
  NewWalletPinScreen({Key key,}) : super(key: key);

  @override
  State<NewWalletPinScreen> createState() => _NewWalletPinScreenState();
}

class _NewWalletPinScreenState extends State<NewWalletPinScreen> {
  TextEditingController pinController = TextEditingController();

  TextEditingController confirmpinController = TextEditingController();

  final pinformKey = GlobalKey<FormState>();

  void _handlePinChanged(String pin) {
    print('PIN changed: $pin');
  }

  void _handlePinConfirmed(String pin) {
    print('PIN confirmed: $pin');
  }

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        offset: Offset(0, 2),
        blurRadius: 6.0,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: pinformKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
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
                   Text("Create new Wallet PIN", style: pBold33,),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("You will need to enter this pin before you can access you wallet", style: pLight16,
                    textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 30,),
                  Pinput(
                    length: 4,
                    onChanged: (String pin){},
                    onSubmitted: (String pin) => {},
                    focusNode: FocusNode(),
                    controller: pinController,
                    //submittedPinTheme: pinPutDecoration,
                    defaultPinTheme: defaultPinTheme,
                    //followingFieldDecoration: pinPutDecoration,
                    pinAnimationType: PinAnimationType.fade,
                    textInputAction: TextInputAction.send,
                  ),
                  SizedBox(height: Get.size.height / 10,),
                  PinKeyboard(
                    onConfirm: (a) {},
                    onBiometric: () {},
                    onChange: (a) {
                      pinController.text = a;
                      if (a.length > 3) {
                        //autoValidate = true;
                        setState(() {});
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EnableBiometricScreen()));
                        print(pinController.text);
                      }
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
