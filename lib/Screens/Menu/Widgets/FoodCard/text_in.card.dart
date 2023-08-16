
import 'package:flutter/material.dart';
import 'package:yeye/Models/food_model.dart';

class FoodCardText extends StatelessWidget {
  const FoodCardText({Key? key, required this.foods, required this.item}) : super(key: key);

  final List<FoodModel> foods;
  final String item;

  @override
  Widget build(BuildContext context) {
    return Text(
      foods[0].getFood(item).toString(),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}