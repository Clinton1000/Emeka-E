import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final ImageProvider image;

  const SocialLoginButton({
    Key key,
    this.text,
    this.backgroundColor = Colors.white,
    this.onPressed,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = backgroundColor == Colors.white ? Colors.black : Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: image,
                height: 25,),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
