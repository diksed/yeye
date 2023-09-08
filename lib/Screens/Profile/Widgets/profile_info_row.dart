import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_colors.dart';

Widget profileInfoRow(String info, IconData icon) {
  return SizedBox(
    height: Get.height / 17.07,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(icon, size: 30, color: AppColors.themeBlueColor),
        SizedBox(
          height: Get.height / 22.76,
          width: Get.width / 1.52,
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              info,
              textAlign: TextAlign.start,
              style:
                  const TextStyle(fontSize: 18, color: AppColors.calendarCardColor),
            ),
          ),
        )
      ],
    ),
  );
}
