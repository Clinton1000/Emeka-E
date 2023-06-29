import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final VoidCallback onPress;
  final TextStyle textStyle;
  final double borderRadius;

  PrimaryButton({
    this.textColor = Colors.white,
    this.backgroundColor = const Color(0xFF5C5CFF),
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
