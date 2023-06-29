import 'package:changecollect/utils/images.dart';
import 'package:changecollect/utils/text_style.dart';
import 'package:changecollect/view/screen/authentication/otp_screen.dart';
import 'package:changecollect/view/widget/back_button.dart';
import 'package:changecollect/view/widget/primary_button.dart';
import 'package:changecollect/view/widget/primary_input_field.dart';
import 'package:changecollect/view/widget/social_login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  bool step1 = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailString = "";
  String passwordString = "";

  final _emailformKey = GlobalKey<FormState>();
  final _passwordformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(emailController.text);
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
                  Visibility(
                    visible: !step1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CCBackButton(
                        onPress: () {
                          setState(() {
                            step1 = !step1;
                          });
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: step1,
                    child: Form(
                      key: _emailformKey,
                      child: Column(
                        children: [
                          SizedBox(height: Get.size.height / 8,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter your email", style: pBold33,),
                          ),
                          SizedBox(height: 12,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Let's see if you have an account", style: pLight18,),
                          ),
                          SizedBox(height: 20,),
                          PrimaryInputField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              } else if (!GetUtils.isEmail(value)) {
                                return 'Invalid Email';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                emailString = value;
                                _emailformKey.currentState.validate();
                              });
                              print(emailString);
                            },
                            prefixIcon: CupertinoIcons.mail_solid,
                            label: "Email address...",
                          ),
                          SizedBox(height: 12,),
                          PrimaryButton(
                            text: "Next",
                            onPress: () {
                              if (_emailformKey.currentState.validate()) {
                                setState(() {
                                  emailString = emailController.text.trim();
                                  step1 = !step1;
                                  print(emailString);
                                });
                                //emailController.clear();
                                //_emailformKey.currentState.reset();
                              }
                            },
                          ),
                          SizedBox(height: Get.size.height / 3.5,),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !step1,
                    child: Form(
                      key: _passwordformKey,
                      child: Column(
                        children: [
                          SizedBox(height: Get.size.height / 8,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Welcome back,\nChidiebere Edeh 👋", style: pBold33,),
                          ),
                          SizedBox(height: 12,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter the password for your account", style: pLight18,),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(emailString, style: pBold14,),
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
                            onChanged: (value) {
                              setState(() {
                                passwordString = value;
                                _emailformKey.currentState.validate();
                              });
                              print(emailString);
                            },
                            prefixIcon: CupertinoIcons.lock,
                            label: "Password...",
                          ),
                          SizedBox(height: 12,),
                          PrimaryButton(
                            text: "Sign In",
                            onPress: () {
                              if (_passwordformKey.currentState.validate()) {
                                print(emailString);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => OTPScreen(email: emailString)),
                                );
                                _passwordformKey.currentState.reset();
                              }
                            },
                          ),
                          SizedBox(height: Get.size.height / 5.5,),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  height: 1.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SocialLoginButton(
                          text: 'Sign in with Apple',
                          backgroundColor: Colors.black,
                          onPressed: () {
                            // Handle Apple registration logic
                          },
                          image: AssetImage(DefaultImages.appleImg),
                        ),
                        SocialLoginButton(
                          text: 'Sign in with Google',
                          backgroundColor: Colors.white,
                          onPressed: () {
                            // Handle Google registration logic
                          },
                          image: AssetImage(DefaultImages.googleImg),
                        ),
                      ],
                    ),
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

