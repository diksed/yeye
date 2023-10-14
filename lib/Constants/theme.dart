import 'package:flutter/services.dart';
import 'package:yeye/Constants/app_colors.dart';

void updateBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.splashColor,
    systemNavigationBarColor: AppColors.splashColor,
  ));
}
