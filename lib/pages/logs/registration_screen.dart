// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main_screens/bottomnavbar.dart';
import 'my_button.dart';

class RegistrationScreen extends StatefulWidget {
  // static const String id = 'Registration_Screen';
  final Function()? onTap;
  const RegistrationScreen({super.key, required this.onTap});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    _cPasswordController.dispose();
    super.dispose();
  }

  // sign user up method
  void signUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try creating the user
    try {
      // check if password is confirmed
      if (_passwordController.text == _cPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else {
        // show error message, passwords don't match
        showErrorMessage("Passwords don't match!");
      }
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),

                // logo
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/CC Icon2i.jpg'),
                  ),
                ),

                const SizedBox(height: 25),

                // let's create an account for you
                Text(
                  'Let\'s create an account for you!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Enter Your Email',
                        hintStyle: TextStyle(color: Colors.grey[500])),
                    obscureText: false,
                  ),
                ),

                const SizedBox(height: 10),

                // password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: _passwordController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Enter Your Password',
                        hintStyle: TextStyle(color: Colors.grey[500])),
                    obscureText: true,
                  ),
                ),

                const SizedBox(height: 10),

                // confirm password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: _cPasswordController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.grey[500])),
                    obscureText: true,
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'If You',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                const SizedBox(height: 20),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//   const RegistrationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RegistrationScreen> createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _cpasswordController = TextEditingController();
//
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     _emailController.dispose();
//     _passwordController.dispose();
//     _cpasswordController.dispose();
//     super.dispose();
//   }
//
//   void createAccount() async {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//
//     // try creating the user
//     try {
//       // check if password is confirmed
//       if (_passwordController.text == _cpasswordController.text) {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//       } else {
//         // show error message, passwords don't match
//         showErrorMessage("Passwords don't match!");
//       }
//       // pop the loading circle
//       Navigator.pop(context);
//     } on FirebaseAuthException catch (e) {
//       // pop the loading circle
//       Navigator.pop(context);
//       // show error message
//       showErrorMessage(e.code);
//     }
//   }
//
//   // error message to user
//   void showErrorMessage(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Colors.deepPurple,
//           title: Center(
//             child: Text(
//               message,
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Hero(
//                   tag: 'logo',
//                   child: Container(
//                     height: 300.0,
//                     child: Image.asset('images/CC Icon2i.jpg'),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 48.0,
//                 ),
//                 TextField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     hintStyle: TextStyle(color: Colors.grey),
//                     hintText: 'Enter your email',
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.blueAccent, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.blueAccent, width: 2.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//                 TextField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     hintStyle: TextStyle(color: Colors.grey),
//                     hintText: 'Enter your password',
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.blueAccent, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.blueAccent, width: 2.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//                 TextField(
//                   controller: _cpasswordController,
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     hintStyle: TextStyle(color: Colors.grey),
//                     hintText: 'Confirm Password',
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.blueAccent, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.blueAccent, width: 2.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                   child: Material(
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                     elevation: 5.0,
//                     child: MaterialButton(
//                       onPressed: () {
//                         //Implement registration functionality.
//                         Navigator.pushNamed(context, BottomNavBar.id);
//                       },
//                       minWidth: 200.0,
//                       height: 42.0,
//                       child: Text(
//                         'Create Account',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
