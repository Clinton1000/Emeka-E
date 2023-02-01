import 'package:changecollect/pages/logs/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main_screens/bottomnavbar.dart';

class AuthPage extends StatelessWidget {
  // static const String id = 'AuthPage';
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const BottomNavBar();
          }

          // user is NOT logged in
          else {
            return const OnboardingScreen();
          }
        },
      ),
    );
  }
}
