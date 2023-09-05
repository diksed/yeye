import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yeye/Common/box_decorations.dart';
import 'package:yeye/Common/text_styles.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Menu/Widgets/RatingBar/rating_bar_container.dart';

import '../../Common/display_size.dart';
import '../../Common/logo_box.dart';
import '../../Common/time_for_calendar.dart';
import '../../Common/utils.dart';
import '../../Models/food_model.dart';
import '../../Models/rating_model.dart';
import 'Widgets/FoodCard/food_card.dart';
import 'menu_controller.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final MenuScreenController controller = Get.put(MenuScreenController());

  @override
  void initState() {
    super.initState();
    controller.formattedDate.value =
        DateFormat('dd-MM-yyyy').format(currentTime);
    controller.fetchFood(controller.formattedDate.value);
    controller.fetchRatings(controller.formattedDate.value);
    if (isWeekend(currentTime)) {
      controller.ratingVisible.value = false;
    } else {
      if (isBetweenTimes()) {
        controller.ratingVisible.value = true;
      } else {
        controller.ratingVisible.value = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Stream<List<FoodModel>> foodModelListStream =
        controller.foodModel.stream.map((foodModel) => [foodModel]);
    Stream<List<RatingModel>> ratingListStream =
        controller.ratingListStream.stream;
    return SafeArea(
      child: ScaffoldMessenger(
        key: Utils.messengerKey,
        child: Scaffold(
          body: Column(
            children: [
              LogoSizedBox(
                  appHeight: displayHeight(context) / 3,
                  appWidth: displayWidth(context) / 3),
              Text(TitleMessages.foodMenu, style: titleTextStyle()),
              SizedBox(height: displayHeight(context) / 176.6),
              GestureDetector(
                  onTap: () async {
                    controller.onDateSelected(context);
                  },
                  child: Obx(
                    () => Container(
                      height: displayHeight(context) / 17.07,
                      width: displayWidth(context) / 3.04,
                      decoration: dateInsideContainerDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.calendar_month, color: Colors.white),
                          Row(
                            children: [
                              Text(controller.formattedDate.value,
                                  style: const TextStyle(color: Colors.white))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: displayHeight(context) / 80.3),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FoodCard(
                    item: AppTexts.mainDish,
                    foodName: FoodMessages.mainDish,
                    stream: foodModelListStream),
                SizedBox(width: displayWidth(context) / 41.1),
                FoodCard(
                    item: AppTexts.sideDish,
                    foodName: FoodMessages.sideDish,
                    stream: foodModelListStream),
              ]),
              SizedBox(height: displayHeight(context) / 80.3),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FoodCard(
                    item: AppTexts.soup,
                    foodName: FoodMessages.soup,
                    stream: foodModelListStream),
                SizedBox(width: displayWidth(context) / 41.1),
                FoodCard(
                    item: AppTexts.sideItem,
                    foodName: FoodMessages.sideDish,
                    stream: foodModelListStream),
              ]),
              RatingBarContainer(
                ratingStream: ratingListStream,
                ratingVisible: controller.ratingVisible,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
