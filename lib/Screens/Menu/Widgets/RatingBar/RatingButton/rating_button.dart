import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Common/box_decorations.dart';
import 'package:yeye/Common/display_size.dart';

import '../../../menu_controller.dart';
import 'colored_container.dart';

class RatingButton extends StatelessWidget {
  const RatingButton({
    Key? key,
    required this.today,
    required this.visible,
  }) : super(key: key);

  final String today;
  final bool? visible;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenuScreenController>();

    return SizedBox(
      height: visible! ? displayHeight(context) / 8.03 : 0,
      width: visible! ? displayWidth(context) / 1.34 : 0,
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
                        ? displayHeight(context) / 22.76
                        : 0,
                    width: controller.rateButtonVisible.value
                        ? displayWidth(context) / 3.425
                        : 0,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.add_comment_rounded, color: Colors.white),
                        Text('Değerlendir',
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
