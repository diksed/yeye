import 'package:flutter/material.dart';
import 'package:yeye/Constants/app_texts.dart';

class CheckSpamFieldError extends StatelessWidget {
  const CheckSpamFieldError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      WarningMessages.checkSpamField,
      style: TextStyle(
          fontSize: 17, color: Colors.red, fontWeight: FontWeight.w500),
    );
  }
}
