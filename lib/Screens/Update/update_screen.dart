import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';

import '../../Common/text_styles.dart';

class AppUpdateScreen extends StatelessWidget {
  const AppUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppTexts.internetConnectionLogo,
                width: Get.width / 1.3),
            SizedBox(height: Get.height / 33.6),
            Text(WarningMessages.newestVersion,
                style: titleTextStyle(
                    fontSize: 20, color: AppColors.themeRedColor),
                textAlign: TextAlign.center),
            SizedBox(height: Get.height / 33.6),
            Text(WarningMessages.updateApp,
                style:
                    titleTextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
