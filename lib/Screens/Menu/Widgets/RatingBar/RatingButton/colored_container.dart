import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../../Common/box_decorations.dart';
import '../../../../../Common/display_size.dart';
import '../../../menu_controller.dart';

class ColoredContainer extends StatelessWidget {
  ColoredContainer({Key? key}) : super(key: key);

  final MenuScreenController controller = Get.find<MenuScreenController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Container(
          decoration: dateInsideContainerDecoration(),
          height: controller.isContainerVisible.value ? displayHeight(context) / 8.03 : 0.0,
          width: controller.isContainerVisible.value ? displayWidth(context) / 1.86 : 0.0,
          child: Column(
            children: [
              Center(
                child: RatingBar.builder(
                  minRating: 0,
                  direction: Axis.horizontal,
                  itemSize: 35,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    controller.starRating.value = rating;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.onRatingUpdate();
                },
                child: const Text(
                  'Değerlendir',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
