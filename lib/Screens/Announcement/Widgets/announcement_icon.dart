import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_colors.dart';

class AnnouncementIcon extends StatelessWidget {
  const AnnouncementIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20,
      left: -20,
      child: Container(
        height: Get.height / 16.8,
        width: Get.width / 9,
        decoration: BoxDecoration(
            color: AppColors.announcementCircleColor,
            borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.announcement_outlined, color: Colors.white),
      ),
    );
  }
}
