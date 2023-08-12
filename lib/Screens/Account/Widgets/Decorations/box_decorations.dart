import 'package:flutter/material.dart';

import '../../../../Constants/app_colors.dart';

BoxDecoration accountBoxDecoration() {
  return const BoxDecoration(
      color: AppColors.whiteShade,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50), topRight: Radius.circular(50)));
}

BoxDecoration accountGradientBoxDecoration() {
  return const BoxDecoration(
    gradient: AppColors.themeColor,
  );
}