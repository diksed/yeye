import 'package:flutter/material.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Menu/Widgets/FoodCard/title_in_card.dart';

import '../../../../Constants/app_colors.dart';
import '../../../../Models/food_model.dart';
import 'line_in_card.dart';
import 'text_in.card.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({
    Key? key,
    required this.item,
    required this.foodName,
    required this.stream,
  }) : super(key: key);

  final String item;
  final String foodName;
  final Stream<List<FoodModel>> stream;

  @override
  FoodCardState createState() => FoodCardState();
}

class FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5.93,
      width: MediaQuery.of(context).size.width / 2.28,
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
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 68.3),
          TitleInCard(foodName: widget.foodName),
          const LineInCard(),
          SizedBox(height: MediaQuery.of(context).size.height / 45.53),
          StreamBuilder(
            stream: widget.stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text(WarningMessages.somethingWrong);
              } else if (snapshot.hasData) {
                final foods = snapshot.data as List<FoodModel>;
                return FoodCardText(foods: foods, item: widget.item);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
