import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../Common/utils.dart';
import '../../../Constants/app_texts.dart';
import '../Widgets/AlertDialogs/user_agreement_dialog.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  RxBool isLogin = true.obs;
  RxBool passwordVisible = false.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final universityController = TextEditingController();
  final campusController = TextEditingController();
  late RxBool campusButton = true.obs;
  late RxString? university;
  late RxString? campus;
  var universities = <RxString>['Samsun Üniversitesi'.obs];
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
    university = ''.obs;
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
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final university = universityController.text.trim();
    final campus = campusController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        university.isEmpty ||
        campus.isEmpty) {
      Utils.showSnackBar(WarningMessages.dontEmptyFields);
    } else if (password.length < 6) {
      Utils.showSnackBar(WarningMessages.least6Characters);
    } else if (!email.endsWith('@samsun.edu.tr')) {
      Utils.showSnackBar(WarningMessages.registerWithSchoolMail);
    } else {
      try {
        final result =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
        if (result.isNotEmpty) {
          Utils.showSnackBar(WarningMessages.emailAlreadyExists);
        } else {
          RxBool acceptedTerms = false.obs;

          await showUserAgreementDialog(acceptedTerms, email, password);
        }
      } catch (e) {
        Utils.showSnackBar(WarningMessages.unknownError);
      }
    }
  }

  Future<void> signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Utils.showSnackBar(WarningMessages.dontEmptyMailPasswordFields);
      return;
    }

    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Get.offAllNamed('/menu');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.showSnackBar(WarningMessages.userNotFound);
        return;
      } else if (e.code == 'wrong-password' || e.code == 'wrong-password') {
        Utils.showSnackBar(WarningMessages.wrongPasswordEmail);
      } else if (e.code == 'user-disabled') {
        Utils.showSnackBar(WarningMessages.disabledUser);
      } else if (e.code == 'too-many-requests') {
        Utils.showSnackBar(WarningMessages.tooManyRequests);
      } else {
        Utils.showSnackBar(WarningMessages.unknownError);
      }
    } catch (e) {
      Utils.showSnackBar(WarningMessages.unknownError);
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
