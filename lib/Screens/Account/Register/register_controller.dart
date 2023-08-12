import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final universityController = TextEditingController();
  final campusController = TextEditingController();
  late bool passwordVisible;
  bool campusButton = true;
  late String? university = '';
  late String? campus;
  var universities = <String>[AccountActions.samsunUniversity];
  var faculties = {
    AccountActions.samsunUniversity: [
      AccountActions.samuCanik,
      AccountActions.samuBallica,
      AccountActions.samuKavak
    ],
    '': ['']
  };

  @override
  void onInit() {
    super.onInit();
    passwordVisible = false;
  }

  Future<void> signUpShowDialog(
    GlobalKey<FormState> formKey,
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController universityController,
    TextEditingController campusController,
  ) async {
    // Registration logic here
  }

  void onClickedSignIn() {
    // Navigate to login page
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
