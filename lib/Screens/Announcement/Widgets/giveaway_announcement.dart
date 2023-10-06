import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Screens/Account/Widgets/AlertDialogs/user_agreement_dialog.dart';

giveawaySnackbar(String? giveawayDesc, String giveawayLink, String buttonText) {
  Get.rawSnackbar(
    margin: const EdgeInsets.only(top: 7),
    message: giveawayDesc,
    borderRadius: 9,
    maxWidth: Get.width / 1.05,
    icon: const Icon(Icons.announcement_outlined, color: Colors.white),
    snackPosition: SnackPosition.TOP,
    duration: const Duration(minutes: 2),
    backgroundColor: AppColors.rawSnackbarColor,
    forwardAnimationCurve: Curves.easeInOut,
    animationDuration: const Duration(seconds: 1, milliseconds: 500),
    mainButton: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Transform.scale(
        scale: 0.9,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
            ),
            onPressed: () => agreementLauncher(giveawayLink),
            child: Text(buttonText,
                style: const TextStyle(color: AppColors.rawSnackbarColor))),
      ),
    ),
  );
}
