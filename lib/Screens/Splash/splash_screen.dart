import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_colors.dart';

import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return  Center(
            child: Image.asset('assets/images/splash.gif')
          );
        },
      ),
    );
  }
}