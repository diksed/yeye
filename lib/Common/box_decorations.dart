import 'package:flutter/material.dart';

import '../Constants/app_colors.dart';

BoxDecoration dateInsideContainerDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(10), color: AppColors.calendarGrey);
}

BoxDecoration customBoxDecoration(
    double circular, Color color, Color boxShadowColor, double opaticy) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(circular),
    color: color,
    boxShadow: [
      BoxShadow(
        color: boxShadowColor.withOpacity(opaticy),
        spreadRadius: 3,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
  );
}
