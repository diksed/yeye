import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import '../../../Constants/app_colors.dart';

class NoFoodCard extends StatelessWidget {
  const NoFoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Get.height / 34.6),
        Container(
          height: Get.height / 4.5,
          width: Get.width / 1.5,
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
          child: const Center(
              child: Text(
            WarningMessages.noFoodService,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
        ),
      ],
    );
  }
}
