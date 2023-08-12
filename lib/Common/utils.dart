import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/app_colors.dart';
import '../Constants/app_texts.dart';

class Utils {
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message) {
  Get.snackbar(
    WarningMessages.warning,
    message,
    duration: const Duration(seconds: 3),
    backgroundColor: AppColors.themeBlueColor,
    colorText: Colors.white,
    borderRadius: 10.0,
    margin: const EdgeInsets.all(16.0),
    snackPosition: SnackPosition.BOTTOM,
  );
}
}
