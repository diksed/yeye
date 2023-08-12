import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Screens/Account/Auth/auth_controller.dart';
import 'package:yeye/Screens/Account/Register/register_screen.dart';

import '../Login/login_screen.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLogin.value
          ? LoginScreen(onClickedRegister: controller.toggle)
          : RegisterScreen(onClickedLogin: controller.toggle),
    );
  }
}
