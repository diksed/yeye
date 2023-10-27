import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Widgets/AlertDialog/alert_dialogs.dart';
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
      required this.height,
      required this.firstLogoVisible,
      required this.secondLogoVisible,
      required this.gestureActive,
      this.firstLogoText,
      this.secondLogoText,
      this.color})
      : super(key: key);

  final bool gestureActive;
  final double height;
  final Color? color;
  final String textFirst;
  final String textSecond;
  final String textThird;
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
                GestureDetector(
                  onTap: gestureActive == true
                      ? () {
                          loadMoneyAlertDialog(
                              LoadMoneyMessages.visitToInstagram,
                              LoadMoneyMessages.areYouSure,
                              AccountActions.okay,
                              LoadMoneyMessages.instagramUrl);
                        }
                      : null,
                  child: AnnouncementLogoTextWidget(
                      text: textSecond,
                      visible: firstLogoVisible,
                      imageText: firstLogoText),
                ),
                GestureDetector(
                  onTap: gestureActive == true
                      ? () {
                          loadMoneyAlertDialog(
                              LoadMoneyMessages.visitToMail,
                              LoadMoneyMessages.areYouSure,
                              AccountActions.okay,
                              LoadMoneyMessages.mailUrl);
                        }
                      : null,
                  child: AnnouncementLogoTextWidget(
                      text: textThird,
                      visible: secondLogoVisible,
                      imageText: secondLogoText),
                ),
              ],
            ),
          ),
          const AnnouncementIcon()
        ],
      ),
    );
  }
}
