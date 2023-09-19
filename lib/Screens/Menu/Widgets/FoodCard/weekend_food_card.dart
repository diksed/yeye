import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yeye/Common/text_styles.dart';
import 'package:yeye/Constants/app_texts.dart';

import '../../../../Constants/app_colors.dart';

Widget weekendFoodCard() {
  return SizedBox(
    child: Center(
        child: Column(
      children: [
        Lottie.asset(AppTexts.weekendFoodCardLogo, width: Get.width / 1.7),
        SizedBox(height: Get.height / 33.6),
        Text(
          WarningMessages.refectoryClosed,
          style: titleTextStyle(fontSize: 20, color: AppColors.themeRedColor),
          textAlign: TextAlign.center,
        ),
      ],
    )),
  );
}
