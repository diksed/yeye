import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Account/Widgets/AlertDialogs/user_agreement_dialog.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_button.dart';
import 'package:yeye/Screens/Update/app_update_controller.dart';

import '../../Common/text_styles.dart';

class AppUpdateScreen extends StatelessWidget {
  const AppUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppUpdateController appUpdateController = Get.put(AppUpdateController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppTexts.appUpdateLogo,
                width: Get.width / 1.3),
            SizedBox(height: Get.height / 33.6),
            Text(WarningMessages.newestVersion,
                style: titleTextStyle(
                    fontSize: 20, color: AppColors.themeRedColor),
                textAlign: TextAlign.center),
            SizedBox(height: Get.height / 33.6),
            Text(WarningMessages.updateApp,
                style:
                    titleTextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center),
            SizedBox(height: Get.height / 33.6),
            LoginRegisterButton(
              onPressed: () {
                agreementLauncher(appUpdateController.urlPath.value);
              },
              width: Get.width / 2,
              height: Get.height / 13,
              text: AccountActions.update,
            )
          ],
        ),
      ),
    );
  }
}
