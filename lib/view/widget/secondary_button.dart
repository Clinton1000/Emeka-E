import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final VoidCallback onPress;
  final TextStyle textStyle;
  final double borderRadius;

  SecondaryButton({
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.text,
    this.onPress,
    this.textStyle,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: Colors.white38), // Add border line
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}

