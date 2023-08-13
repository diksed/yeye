import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Screens/Account/Auth/auth_screen.dart';

import '../../Constants/app_texts.dart';
import '../Menu/menu_screen.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: Image.asset(AppTexts.loadingImage),
            );
          } else if (controller.hasError.value) {
            return const Center(
              child: Text(WarningMessages.somethingWrong),
            );
          } else if (controller.hasData.value && controller.isSignedIn.value) {
            return const MenuScreen();
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}
