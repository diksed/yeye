import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/utils.dart';
import '../../../Constants/app_texts.dart';
import '../../../Service/firebase.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  final RxBool isButtonActive = false.obs;

  @override
  void onInit() {
    isButtonActive(false);

    final RxString emailValue = ''.obs;

    ever(emailValue, (_) {
      isButtonActive(emailValue.value.trim().isNotEmpty);
    });

    emailController.addListener(() {
      emailValue.value = emailController.text;
    });

    super.onInit();
  }

  Future<void> resetPassword() async {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      Utils.showSnackBar(WarningMessages.dontEmptyMail);
      return;
    }

    try {
      await auth.sendPasswordResetEmail(email: email);
      Utils.showSnackBar(WarningMessages.resetPasswordEmailSent);

      Get.offAndToNamed('/login');
    } catch (error) {
      Utils.showSnackBar(WarningMessages.resetPasswordEmailError);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
