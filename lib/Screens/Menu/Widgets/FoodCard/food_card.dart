import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Screens/Menu/Widgets/FoodCard/title_in_card.dart';

import '../../../../Constants/app_colors.dart';
import '../../../../Models/food_model.dart';
import 'line_in_card.dart';
import 'text_in_card.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({
    super.key,
    required this.item,
    required this.foodName,
    required this.foods,
  });

  final String item;
  final String foodName;
  final List<FoodModel> foods;

  @override
  FoodCardState createState() => FoodCardState();
}

class FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 5.93,
      width: Get.width / 2.28,
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height / 68.3),
            TitleInCard(foodName: widget.foodName),
            const LineInCard(),
            SizedBox(height: Get.height / 45.53),
            FoodCardText(foods: widget.foods, item: widget.item),
          ],
        ),
      ),
    );
  }
}
