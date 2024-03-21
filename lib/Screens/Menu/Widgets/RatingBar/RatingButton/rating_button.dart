import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Common/box_decorations.dart';
import 'package:yeye/Constants/app_texts.dart';
import '../../../menu_controller.dart';
import 'colored_container.dart';

class RatingButton extends StatelessWidget {
  const RatingButton({
    super.key,
    required this.today,
    required this.visible,
  });

  final String today;
  final bool? visible;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenuScreenController>();

    return SizedBox(
      height: visible! ? Get.height / 8.03 : 0,
      width: visible! ? Get.width / 1.34 : 0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  controller.onRateButtonPressed(today);
                },
                child: Obx(
                  () => Container(
                    decoration: dateInsideContainerDecoration(),
                    height: controller.rateButtonVisible.value
                        ? Get.height / 22.76
                        : 0,
                    width: controller.rateButtonVisible.value
                        ? Get.width / 3.425
                        : 0,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.add_comment_rounded, color: Colors.white),
                        Text(AccountActions.evaluate,
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(child: ColoredContainer()),
        ],
      ),
    );
  }
}
