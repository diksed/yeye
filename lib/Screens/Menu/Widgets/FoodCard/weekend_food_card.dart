import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_colors.dart';

Widget weekendFoodCard() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      color: AppColors.cardColor,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.08),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    height: Get.height / 2.859,
    width: Get.width / 1.107,
    child: const Center(child: Text('Weekend Food Card')),
  );
}
