import 'package:flutter/material.dart';

class CCBackButton extends StatelessWidget {
  final VoidCallback onPress;

  CCBackButton({this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 85,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
          //color: Colors.white,
        ),
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            SizedBox(width: 5.0),
            Text(
              'Back',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
