import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/box_decorations.dart';
import '../../../Constants/app_colors.dart';
import 'Texts/announcement_logo_text_widget.dart';
import 'Texts/default_announcement_text.dart';
import 'announcement_icon.dart';

class DefaultAnnouncement extends StatelessWidget {
  const DefaultAnnouncement(
      {Key? key,
      required this.textFirst,
      required this.textSecond,
      required this.textThird,
      required this.textFourth,
      required this.height,
      required this.firstLogoVisible,
      required this.secondLogoVisible,
      this.firstLogoText,
      this.secondLogoText,
      this.color})
      : super(key: key);

  final double height;
  final Color? color;
  final String textFirst;
  final String textSecond;
  final String textThird;
  final String textFourth;
  final String? firstLogoText;
  final String? secondLogoText;
  final bool firstLogoVisible;
  final bool secondLogoVisible;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: height,
            width: Get.width / 1.37,
            decoration:
                customBoxDecoration(10, AppColors.cardColor, Colors.black, 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: DefaultAnnouncementText(
                      text: textFirst, textAlign: TextAlign.center),
                ),
                AnnouncementLogoTextWidget(
                    text: textSecond,
                    visible: firstLogoVisible,
                    imageText: firstLogoText),
                AnnouncementLogoTextWidget(
                    text: textThird,
                    visible: secondLogoVisible,
                    imageText: secondLogoText),
                DefaultAnnouncementText(
                    text: textFourth,
                    textAlign: TextAlign.center,
                    color: color),
              ],
            ),
          ),
          const AnnouncementIcon()
        ],
      ),
    );
  }
}
