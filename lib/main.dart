// ignore_for_file: prefer_const_constructors
import 'package:changecollect/pages/logs/auth_page.dart';
import 'package:changecollect/pages/logs/forgot_password.dart';
import 'package:changecollect/pages/introductory/introduction main.dart';
import 'package:changecollect/pages/logs/login_screen.dart';
import 'package:changecollect/pages/logs/onboarding_screen.dart';
import 'package:changecollect/pages/logs/registration_screen.dart';
import 'package:changecollect/pages/main_screens/crypto.dart';
import 'package:changecollect/pages/main_screens/textfieldCC.dart';
import 'package:changecollect/pages/main_screens/textfieldGC.dart';
import 'package:changecollect/pages/main_screens/uptabs.dart';
import 'package:changecollect/pages/main_screens/bottomnavbar.dart';
import 'package:changecollect/pages/main_screens/pay.dart';
import 'package:changecollect/pages/main_screens/fund.dart';
import 'package:flutter/material.dart';
import 'pages/main_screens/home_page.dart';
import 'pages/main_screens/fiat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xffffffff),
        scaffoldBackgroundColor: Color(0xffffffff),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: IntroductionMain.id,
      routes: {
        TextFieldGC.id: (context) => TextFieldGC(),
        Pay.id: (context) => Pay(),
        FundAccount.id: (context) => FundAccount(),
        Forgot_Password.id: (context) => Forgot_Password(),
        BottomNavBar.id: (context) => BottomNavBar(),
        TextFieldCC.id: (context) => TextFieldCC(),
        UpTabs.id: (context) => UpTabs(),
        Fiat.id: (context) => Fiat(),
        Crypto.id: (context) => Crypto(),
        // AuthPage.id: (context) => AuthPage(),
        IntroductionMain.id: (context) => IntroductionMain(),
        OnboardingScreen.id: (context) => OnboardingScreen(),
        // LoginScreen.id: (context) => LoginScreen
        // RegistrationScreen.id: (context) => RegistrationScreen(),
        Homepage.id: (context) => Homepage(),
      },
    );
  }
}
