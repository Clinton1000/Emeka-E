// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgot_password.dart';
import 'my_button.dart';

class LoginScreen extends StatefulWidget {
  // static const String id = 'Login_Screen';
  final Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // sign user in method
  void signUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      //showErrorMessage(e.code);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  // error message to user
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Incorrect Password',
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
                const SizedBox(height: 50),

                // logo
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/CC Icon2i.jpg'),
                  ),
                ),

                const SizedBox(height: 25.0),

                // welcome back, you've been missed!
                Text(
                  'Welcome',
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
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Enter Your Password',
                        hintStyle: TextStyle(color: Colors.grey[500])),
                    obscureText: true,
                  ),
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Forgot_Password.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: "Sign In",
                  onTap: signUserIn,
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
                          'Or',
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
//

                const SizedBox(height: 20),

                // google + apple sign in buttons is supposed to be here

                const SizedBox(height: 7),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
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
//                   onChanged: (value) {
//                     //Do something with the user input.
//                   },
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
//                           BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//                 TextField(
//                   onChanged: (value) {
//                     //Do something with the user input.
//                   },
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     hintStyle: TextStyle(color: Colors.grey),
//                     hintText: 'Enter your password.',
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Colors.lightBlueAccent, width: 2.0),
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
//                     color: Colors.lightBlueAccent,
//                     borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                     elevation: 5.0,
//                     child: MaterialButton(
//                       onPressed: () {
//                         //Implement login functionality.
//                       },
//                       minWidth: 200.0,
//                       height: 42.0,
//                       child: Text(
//                         'Log In',
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
