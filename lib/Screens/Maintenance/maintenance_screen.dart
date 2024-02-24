import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yeye/Common/text_styles.dart';
import 'package:yeye/Common/time_for_calendar.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Models/food_model.dart';
import 'package:yeye/Screens/Maintenance/maintenance_controller.dart';
import 'package:yeye/Screens/Menu/Widgets/FoodCard/food_card.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  final MaintenanceController controller = Get.put(MaintenanceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppTexts.maintenanceLogo, width: Get.width / 1.5),
            Text(WarningMessages.inMaintenance, style: titleTextStyle()),
            Text(WarningMessages.thanksForPatience,
                style: titleTextStyle(fontSize: 20)),
            SizedBox(height: Get.height / 67.2),
            Visibility(
              visible: isWeekend(currentTime) ? false : true,
              child: const Divider(thickness: 1, color: Colors.amber),
            ),
            Visibility(
                visible: isWeekend(currentTime) ? false : true,
                child: Text(TitleMessages.foodMenu,
                    style: titleTextStyle(fontSize: 20))),
            StreamBuilder(
              stream:
                  controller.foodModel.stream.map((foodModel) => [foodModel]),
              builder: (context, snapshot) {
                if (isWeekend(currentTime)) {
                  return Container();
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
            )
          ],
        ),
      ),
    );
  }
}
