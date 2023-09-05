import 'package:get/get.dart';

double calculateCommentHeight(int length) {
  if (length <= 10) {
    return Get.height / 22.4;
  } else if (length <= 20) {
    return Get.height / 16.8;
  } else if (length <= 30) {
    return Get.height / 13.44;
  } else if (length <= 40) {
    return Get.height / 11.2;
  } else if (length <= 50) {
    return Get.height / 9.6;
  } else if (length <= 60) {
    return Get.height / 8.4;
  } else if (length <= 70) {
    return Get.height / 7.466;
  } else if (length <= 80) {
    return Get.height / 6.72;
  } else {
    return Get.height / 6.109;
  }
}
