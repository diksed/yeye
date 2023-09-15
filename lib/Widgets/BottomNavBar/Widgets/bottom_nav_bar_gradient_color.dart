import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/app_colors.dart';

class BottomNavBarGradientContainer extends StatelessWidget {
  const BottomNavBarGradientContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.themeColor),
      height: Get.height / 12.218,
    );
  }
}
