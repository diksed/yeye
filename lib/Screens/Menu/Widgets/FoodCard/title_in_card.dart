import 'package:flutter/material.dart';
import 'package:yeye/Constants/app_colors.dart';

class TitleInCard extends StatelessWidget {
  const TitleInCard({Key? key, required this.foodName}) : super(key: key);

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
