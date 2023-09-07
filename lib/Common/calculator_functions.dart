import 'package:get/get.dart';
import 'package:yeye/Common/time_for_calendar.dart';

bool commentCardIsVisible(String commentDate, bool isCommented) {
  if (isWeekend(currentTime)) {
    return false;
  } else {
    if (commentDate == currentDate) {
      if (isCommented == false) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

bool commentLineIsVisible(String commentDate) {
  if (isWeekend(currentTime)) {
    return false;
  } else {
    if (commentDate == currentDate) {
      return true;
    } else {
      return false;
    }
  }
}

double calculateListViewHeight(String commentDate, bool isCommented) {
  if (!commentDate.contains(currentDate)) {
    return Get.height / 1.5627;
  } else {
    if (isCommented == false) {
      return Get.height / 2.43;
    } else {
      return Get.height / 1.5627;
    }
  }
}

double calculateCommentHeight(int length) {
  if (length <= 20) {
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
