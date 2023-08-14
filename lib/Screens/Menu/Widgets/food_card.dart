import 'package:flutter/material.dart';
import 'package:yeye/Constants/app_texts.dart';

import '../../../Constants/app_colors.dart';
import '../../../Models/food_model.dart';

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

class LineInCard extends StatelessWidget {
  const LineInCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 20,
      endIndent: 20,
      thickness: 2,
      color: Colors.blue,
    );
  }
}

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

