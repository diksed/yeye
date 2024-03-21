import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.titleText,
    required this.contentText,
    required this.buttonText,
    required this.onPressed,
  });
  final String titleText;
  final String buttonText;
  final String contentText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: Text(titleText),
      content: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: [
            TextSpan(text: contentText, style: const TextStyle(height: 1.5)),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Get.back(),
            child: const Text(LoadMoneyMessages.goBack)),
        TextButton(onPressed: () => onPressed(), child: Text(buttonText))
      ],
    );
  }
}
