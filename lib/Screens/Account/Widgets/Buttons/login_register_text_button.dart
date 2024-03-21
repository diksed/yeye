import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginRegisterTextButton extends StatelessWidget {
  const LoginRegisterTextButton({
    super.key,
    required this.text,
    required this.textButton,
    required this.onClicked,
  });

  final String text;
  final String textButton;
  final Function() onClicked;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: text,
            style: const TextStyle(
              color: Colors.grey,
            )),
        TextSpan(
            text: textButton,
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()..onTap = onClicked)
      ])),
    );
  }
}
