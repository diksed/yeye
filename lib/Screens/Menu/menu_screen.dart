import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yeye/Common/box_decorations.dart';
import 'package:yeye/Common/text_styles.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Menu/Widgets/FoodCard/weekend_food_card.dart';
import 'package:yeye/Screens/Menu/Widgets/RatingBar/rating_bar_container.dart';
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
    if (isWeekend(currentTime)) {
      controller.ratingVisible.value = false;
    } else {
      controller.fetchFood(controller.formattedDate.value);
      controller.fetchRatings(controller.formattedDate.value);
      if (isBetweenTimes()) {
        controller.ratingVisible.value = true;
      } else {
        controller.ratingVisible.value = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Stream<List<RatingModel>> ratingListStream =
        controller.ratingListStream.stream;
    return SafeArea(
      child: ScaffoldMessenger(
        key: Utils.menuMessengerKey,
        child: Scaffold(
          body: Column(
            children: [
              LogoSizedBox(height: Get.height / 3, width: Get.width / 3),
              Text(TitleMessages.foodMenu, style: titleTextStyle()),
              SizedBox(height: Get.height / 176.6),
              GestureDetector(
                  onTap: () async {
                    controller.onDateSelected(context);
                  },
                  child: Obx(
                    () => Container(
                      height: Get.height / 17.07,
                      width: Get.width / 3.04,
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
              SizedBox(height: Get.height / 80.3),
              StreamBuilder(
                stream:
                    controller.foodModel.stream.map((foodModel) => [foodModel]),
                builder: (context, snapshot) {
                  if (isWeekend(controller.selectedPickedDate.value)) {
                    return Center(
                        child: Column(
                      children: [
                        SizedBox(height: Get.height / 33.6),
                        weekendFoodCard(),
                      ],
                    ));
                  }
                  if (snapshot.hasData) {
                    final foods = snapshot.data as List<FoodModel>;
                    return Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FoodCard(
                                  item: AppTexts.mainDish,
                                  foodName: FoodMessages.mainDish,
                                  foods: foods),
                              SizedBox(width: Get.width / 41.1),
                              FoodCard(
                                  item: AppTexts.sideDish,
                                  foodName: FoodMessages.sideDish,
                                  foods: foods),
                            ]),
                        SizedBox(height: Get.height / 80.3),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FoodCard(
                                  item: AppTexts.soup,
                                  foodName: FoodMessages.soup,
                                  foods: foods),
                              SizedBox(width: Get.width / 41.1),
                              FoodCard(
                                  item: AppTexts.sideItem,
                                  foodName: FoodMessages.sideDish,
                                  foods: foods),
                            ]),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              Obx(
                () => Visibility(
                  visible: isWeekend(controller.selectedPickedDate.value)
                      ? false
                      : true,
                  child: RatingBarContainer(
                    ratingStream: ratingListStream,
                    ratingVisible: controller.ratingVisible,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
