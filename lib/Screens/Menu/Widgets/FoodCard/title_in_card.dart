import 'package:flutter/material.dart';
import 'package:yeye/Constants/app_colors.dart';

class TitleInCard extends StatelessWidget {
  const TitleInCard({super.key, required this.foodName});

  final String foodName;

  @override
  Widget build(BuildContext context) {
    return Text(
      foodName,
      style: const TextStyle(
        color: AppColors.cardTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
