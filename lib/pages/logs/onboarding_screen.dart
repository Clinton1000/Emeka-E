import '../main_screens/bottomnavbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  static const String id = 'Onboarding_Screen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute:
            FirebaseAuth.instance.currentUser == null ? '/login' : '/profile',
        routes: {
          '/login': (context) {
            return SignInScreen(actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                if (!state.user!.emailVerified) {
                  Navigator.pushNamed(context, '/verify-email');
                } else {
                  Navigator.pushReplacementNamed(context, BottomNavBar.id);
                }
              }),
            ]);
          },
          '/profile': (context) => const BottomNavBar(),
          '/verify-email': (context) => EmailVerificationScreen(
                actionCodeSettings: ActionCodeSettings(
                    url: 'https://changecollect-7cced.firebaseapp.com'),
                actions: [
                  EmailVerifiedAction(() {
                    Navigator.pushReplacementNamed(context, BottomNavBar.id);
                  }),
                  AuthCancelledAction((context) {
                    FirebaseUIAuth.signOut(context: context);
                    Navigator.pushReplacementNamed(
                        context, const SignInScreen() as String);
                  }),
                ],
              ),
        });
  }
}

// class OnboardingScreen extends StatefulWidget {
//   static const String id = 'Onboarding_Screen';
//   const OnboardingScreen({super.key});
//   // const OnboardingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   // initially show login page
//   bool showLoginScreen = true;
//
//   // toggle between login and register page
//   void togglePages() {
//     setState(() {
//       showLoginScreen = !showLoginScreen;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (showLoginScreen) {
//       return LoginScreen(
//         onTap: togglePages,
//       );
//     } else {
//       return RegistrationScreen(
//         onTap: togglePages,
//       );

//////////////////////////////////////////
//
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         // ignore: prefer_const_constructors
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Hero(
//                   tag: 'logo',
//                   child: SizedBox(
//                     height: 50.0,
//                     child: Image.asset('images/CC Icon2i.jpg'),
//                   ),
//                 ),
//                 // ignore: prefer_const_constructors
//                 Text(
//                   'Changecollect',
//                   // ignore: prefer_const_constructors
//                   style: TextStyle(
//                     fontSize: 40.0,
//                     fontWeight: FontWeight.w900,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//             // ignore: prefer_const_constructors
//             SizedBox(
//               height: 48.0,
//             ),
//             Padding(
//               // ignore: prefer_const_constructors
//               padding: EdgeInsets.symmetric(vertical: 16.0),
//               child: Material(
//                 elevation: 5.0,
//                 color: Colors.lightBlueAccent,
//                 borderRadius: BorderRadius.circular(30.0),
//                 child: MaterialButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, LoginScreen.id);
//                   },
//                   minWidth: 200.0,
//                   height: 42.0,
//                   // ignore: prefer_const_constructors
//                   child: Text(
//                     'Log In',
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               // ignore: prefer_const_constructors
//               padding: EdgeInsets.symmetric(vertical: 16.0),
//               child: Material(
//                 color: Colors.blueAccent,
//                 borderRadius: BorderRadius.circular(30.0),
//                 elevation: 5.0,
//                 child: MaterialButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, RegistrationScreen.id);
//                   },
//                   minWidth: 200.0,
//                   height: 42.0,
//                   // ignore: prefer_const_constructors
//                   child: Text(
//                     'Create Account',
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pushNamed(context, Forgot_Password.id);
//                   },
//                   child: const Text(
//                     'Forgot password',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
