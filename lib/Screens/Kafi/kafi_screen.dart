import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Common/logo_box.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Kafi/Widgets/no_food_card.dart';
import 'package:yeye/Screens/Kafi/kafi_controller.dart';
import '../../Common/text_styles.dart';
import '../../Common/time_for_calendar.dart';
import '../../Models/food_model.dart';
import '../Menu/Widgets/FoodCard/food_card.dart';

class KafiScreen extends StatefulWidget {
  const KafiScreen({super.key});

  @override
  State<KafiScreen> createState() => _KafiScreenState();
}

class _KafiScreenState extends State<KafiScreen> {
  final KafiController controller = Get.put(KafiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height / 18),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: LogoSizedBox(
                    height: Get.height / 1.5, width: Get.width / 1.5),
              ),
              SizedBox(height: Get.height / 67.2),
              Text(WarningMessages.thanksForEverything,
                  style: titleTextStyle(color: AppColors.themeRedColor)),
              SizedBox(height: Get.height / 67.2),
              const Text(WarningMessages.farewellText,
                  textAlign: TextAlign.center),
              const Text(WarningMessages.farewellText2,
                  textAlign: TextAlign.center),
              SizedBox(height: Get.height / 67.2),
              const Text(WarningMessages.farewellText3,
                  textAlign: TextAlign.center),
              SizedBox(height: Get.height / 67.2),
              const Divider(thickness: 1, color: Colors.amber),
              SizedBox(height: Get.height / 67.2),
              Visibility(
                  visible: isWeekend(currentTime) ? false : true,
                  child: Text('${TitleMessages.foodMenu} ($formattedToday)',
                      style: titleTextStyle(fontSize: 20))),
              StreamBuilder(
                stream:
                    controller.foodModel.stream.map((foodModel) => [foodModel]),
                builder: (context, snapshot) {
                  if (isWeekend(currentTime)) {
                    return const NoFoodCard();
                  } else {
                    if (snapshot.hasData) {
                      final foods = snapshot.data as List<FoodModel>;
                      return Transform.scale(
                        scale: 0.9,
                        child: Column(
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
                                      foodName: FoodMessages.sideItem,
                                      foods: foods),
                                ]),
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Get.toNamed('/credits');
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.rawSnackbarColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text(
          ContactInfoText.contributors,
          style: TextStyle(fontSize: 16),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
