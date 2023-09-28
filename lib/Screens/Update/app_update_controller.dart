import 'dart:io';

import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';

class AppUpdateController extends GetxController {
  bool isIOS = Platform.isIOS;
  RxString urlPath = "".obs;
  @override
  void onInit() {
    super.onInit();
    checkDevicePlatform();
  }

  void checkDevicePlatform() {
    if (isIOS) {
      urlPath.value = ContactInfoText.appStoreLink;
    } else {
      urlPath.value = ContactInfoText.googlePlayLink;
    }
  }
}
