import 'package:flutter/material.dart';

class DefaultAnnouncementText extends StatelessWidget {
  const DefaultAnnouncementText(
      {super.key,
      required this.text,
      this.textAlign,
      this.fontWeight,
      this.color});
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(fontSize: 17, fontWeight: fontWeight, color: color));
  }
}
