import 'package:flutter/material.dart';

class AnnouncementTextWidget extends StatelessWidget {
  const AnnouncementTextWidget({super.key, required this.text, this.textAlign});
  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: const TextStyle(color: Colors.black, fontSize: 17));
  }
}
