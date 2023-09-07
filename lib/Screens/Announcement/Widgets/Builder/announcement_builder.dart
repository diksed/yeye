import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/box_decorations.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Models/announcement_model.dart';
import '../Texts/announcement_text.dart';
import '../announcement_icon.dart';

Widget buildAnnouncement(AnnouncementModel announcement) {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Align(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: Get.height / 6.83,
              width: Get.width / 1.37,
              decoration: customBoxDecoration(
                  10, AppColors.cardColor, Colors.black, 0.1),
              child: SizedBox(
                height: Get.height / 11.38,
                width: Get.width / 1.64,
                child: Center(
                  child: AnnouncementTextWidget(
                      text: announcement.announcement,
                      textAlign: TextAlign.center),
                ),
              ),
            ),
            const AnnouncementIcon(),
          ],
        ),
      ),
    );
  });
}
