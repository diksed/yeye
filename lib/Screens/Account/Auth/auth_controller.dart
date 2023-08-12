import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../Common/utils.dart';
import '../../../Constants/app_texts.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  RxBool isLogin = true.obs;
  RxBool passwordVisible = false.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final universityController = TextEditingController();
  final campusController = TextEditingController();
  late bool campusButton;
  late String? university;
  late String? campus;
  var universities = <String>['Samsun Üniversitesi'];
  var faculties = {
    'Samsun Üniversitesi': [
      'Canik Kampüsü',
      'Ballıca Kampüsü',
      'Kavak Meslek Yüksekokulu'
    ],
    '': ['']
  };

  @override
  void onInit() {
    super.onInit();
    passwordVisible.value = false;
    campusButton = true;
    university = '';
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    universityController.dispose();
    campusController.dispose();
    super.dispose();
  }

  Future<void> signUpShowDialog(
    GlobalKey<FormState> formKey,
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController universityController,
    TextEditingController campusController,
  ) async {
    // Implement the registration logic here
  }

  Future<void> signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    Get.dialog(
      Center(child: Image.asset(AppTexts.loadingImage)),
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
        Utils.showSnackBar(WarningMessages.emptyField);
      } else {
        Utils.showSnackBar(WarningMessages.wrongPasswordEmail);
      }
    } finally {
      Get.back();
    }
  }

  Future<void> resetPassword() async {
    try {
      await auth.sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar(WarningMessages.passwordResetMail);
      Get.offAllNamed('/login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.showSnackBar(WarningMessages.userNotFound);
      } else if (e.code == 'invalid-email') {
        Utils.showSnackBar(WarningMessages.isValidEmail);
      }
    }
  }

  void toggle() {
    isLogin.value = !isLogin.value;
  }
}
