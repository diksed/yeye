import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Common/utils.dart';
import '../../../Constants/app_texts.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  Future<void> resetPassword() async {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      Utils.showSnackBar(WarningMessages.dontEmptyMail);
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
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
