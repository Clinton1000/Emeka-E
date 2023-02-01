import 'package:flutter/material.dart';

import 'my_button.dart';

class Forgot_Password extends StatefulWidget {
  static const String id = 'Forgot_Password';
  const Forgot_Password({Key? key}) : super(key: key);

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  final _forgotpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 400.0,
                    child: Image.asset('images/CC Icon2i.jpg'),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                const Center(
                  child: Text(
                    'Enter your email to receive a password reset link',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextField(
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  controller: _forgotpasswordController,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(color: Colors.grey[500])),
                  obscureText: false,
                ),
                const SizedBox(height: 25),

                // sign in button
                MaterialButton(
                  shape: (RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
                  onPressed: () {},
                  color: Colors.black,
                  child: const Text('Reset Password'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//                 TextField(
//                   controller: forgotpasswordController,
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(color: Colors.black),
//                   decoration: const InputDecoration(
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
//                   height: 15.0,
//                 ),
//                 MaterialButton(
//                   shape: (RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(32.0),
//                   )),
//                   onPressed: () {},
//                   color: Colors.blue,
//                   child: const Text('Reset Password'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
