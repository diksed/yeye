import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../Common/utils.dart';
import '../../../Constants/app_texts.dart';
import '../../../Service/firebase.dart';

class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController campusController = TextEditingController();
  RxBool acceptedTerms = false.obs;
  RxBool isLogin = true.obs;
  RxBool passwordVisible = false.obs;
  RxBool campusButton = true.obs;
  RxString? university;
  RxString? campus;

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

  void toggle() {
    isLogin.value = !isLogin.value;
  }

  Future<void> signUpShowDialog() async {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) return;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final campus = campusController.text.trim();
    final university = universityController.text.trim();
    if (email.isEmpty ||
        password.isEmpty ||
        campus.isEmpty ||
        university.isEmpty) {
      Utils.showSnackBar(WarningMessages.dontEmptyFields);
      return;
    } else if (!acceptedTerms.value) {
      Utils.showSnackBar(WarningMessages.acceptTerms);
      return;
    } else if (!email.contains('@samsun.edu.tr')) {
      Utils.showSnackBar(WarningMessages.registerWithSchoolMail);
      return;
    } else if (password.length < 6) {
      Utils.showSnackBar(WarningMessages.least6Characters);
      return;
    } else {
      onRegisterPressed();
    }
  }

  void onRegisterPressed() async {
    Get.dialog(
      Center(child: Image.asset(AppTexts.loadingImage)),
      barrierDismissible: false,
    );
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      await auth.currentUser!.sendEmailVerification();
      Get.toNamed('/verify-email');

      await firestore
          .collection('users')
          .doc('createdUsers')
          .collection('allUsers')
          .doc(userCredential.user!.uid)
          .set({
        'id': userCredential.user!.uid,
        'created_at': Timestamp.now(),
        'myBlocked': [],
        'email': emailController.text.trim(),
        'university': universityController.text.trim(),
        'campus': campusController.text.trim(),
        'suspended': false,
      });
    } on FirebaseAuthException catch (e) {
      Get.back();
      handleFirebaseAuthException(e);
    }
  }

  Future<void> signIn() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) return;

    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Utils.showSnackBar(WarningMessages.dontEmptyMailPasswordFields);
      return;
    }
    Get.dialog(
      Center(child: Image.asset(AppTexts.loadingImage)),
      barrierDismissible: false,
    );

    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (userCredential.user!.emailVerified) {
        Get.offAllNamed('/bottom-nav-bar');
      } else {
        Get.toNamed('/verify-email');
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      handleFirebaseAuthException(e);
    }
  }
}
