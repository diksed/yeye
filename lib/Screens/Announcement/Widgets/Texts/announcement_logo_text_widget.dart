import 'package:flutter/material.dart';
import 'package:yeye/Constants/app_texts.dart';

import 'default_announcement_text.dart';

class AnnouncementLogoTextWidget extends StatefulWidget {
  const AnnouncementLogoTextWidget(
      {super.key,
      required this.text,
      required this.visible,
      required this.imageText});
  final String text;
  final bool visible;
  final String? imageText;

  @override
  State<AnnouncementLogoTextWidget> createState() =>
      AnnouncementLogoTextWidgetState();
}

class AnnouncementLogoTextWidgetState
    extends State<AnnouncementLogoTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: widget.visible,
          child: SizedBox(
              height: 20,
              width: 20,
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Image.asset(widget.imageText ?? AppTexts.mailLogo),
              )),
        ),
        DefaultAnnouncementText(text: widget.text, textAlign: TextAlign.center),
      ],
    );
  }
}
