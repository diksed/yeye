import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yeye/Common/text_styles.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';

class SuspendedScreen extends StatelessWidget {
  const SuspendedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppTexts.suspendedLogo, width: Get.width / 1.3),
          SizedBox(height: Get.height / 16.8),
          Text(
            WarningMessages.yourAccountSuspended,
            style: titleTextStyle(fontSize: 20, color: AppColors.themeRedColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Get.height / 16.8),
          SizedBox(
            child: Column(
              children: [
                Text(
                  ContactInfoText.contactUs,
                  style: titleTextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Get.height / 67.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppTexts.instagramLogo, width: Get.width / 20),
                    Text(
                      ContactInfoText.contactYeYeInstagram,
                      style: titleTextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppTexts.mailLogo, width: Get.width / 20),
                    Text(
                      ContactInfoText.contactYeYeMail,
                      style: titleTextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
