// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../logs/auth_page.dart';
import 'introduction1.dart';
import 'introduction2.dart';
import 'introduction3.dart';

class IntroductionMain extends StatefulWidget {
  static const String id = 'introduction main';

  const IntroductionMain({Key? key}) : super(key: key);

  @override
  State<IntroductionMain> createState() => _IntroductionMainState();
}

class _IntroductionMainState extends State<IntroductionMain> {
  // ignore: prefer_final_fields
  PageController _controller = PageController();

  //keep track if we are on the last page or not

  bool onlastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onlastpage = (index == 2);
              });
            },
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Introduction1(),
              Introduction2(),
              Introduction3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip

                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    'skip',
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                SmoothPageIndicator(controller: _controller, count: 3),

                onlastpage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AuthPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'done',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'next',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
