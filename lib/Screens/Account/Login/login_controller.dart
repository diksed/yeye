import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../Common/utils.dart';
import '../../../Constants/app_texts.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  RxBool passwordVisible = false.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    passwordVisible.value = false;
  }

  Future<void> signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    Get.dialog(
      Center(child: Image.asset(Texts.loadingText)),
      barrierDismissible: false,
    );

    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Get.offAllNamed('/menu');
    } on FirebaseAuthException {
      if (emailController.text.trim().isEmpty ||
          passwordController.text.trim().isEmpty) {
        Utils.showSnackBar(WarningText.emptyField);
      } else {
        Utils.showSnackBar(WarningText.wrongPasswordEmail);
      }
    } finally {
      Get.back();
    }
  }

  void navigateToRegister() {
    Get.offNamed('/register');
  }

  Future<void> signUp() async {
    Get.dialog(
      Center(child: Image.asset(Texts.loadingText)),
      barrierDismissible: false,
    );

    try {
      await createUser(emailController, passwordController);

      Get.offAllNamed('/menu');
    } finally {
      Get.back();
    }
  }

  Future<void> resetPassword() async {
    try {
      await auth.sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar(WarningText.passwordResetMail);
      Get.offAllNamed('/login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.showSnackBar(WarningText.userNotFound);
      } else if (e.code == 'invalid-email') {
        Utils.showSnackBar(WarningText.isValidEmail);
      }
    }
  }

  Future<UserCredential> createUser(TextEditingController emailController,
      TextEditingController passwordController) {
    return auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }
}
