import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Account/Widgets/AlertDialogs/user_agreement_dialog.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_button.dart';
import 'package:yeye/Screens/Profile/delete_user_controller.dart';
import 'package:yeye/Service/firebase.dart';
import 'package:yeye/Widgets/AlertDialog/custom_alert_dialog.dart';

Future<void> logoutAlertDialog() {
  return Get.dialog(CustomAlertDialog(
      titleText: AccountActions.logout,
      contentText: LoadMoneyMessages.areYouSure,
      buttonText: AccountActions.logout,
      onPressed: () => [
            auth.signOut(),
            Get.back(canPop: true),
          ]));
}

Future<void> loadMoneyAlertDialog() {
  return Get.dialog(CustomAlertDialog(
      titleText: LoadMoneyMessages.loadMoneyToCard,
      contentText: LoadMoneyMessages.areYouSure,
      buttonText: LoadMoneyMessages.loadMoney,
      onPressed: () => agreementLauncher(LoadMoneyMessages.websiteUrl)));
}

Future<void> deleteAccountAlertDialog() {
  return Get.bottomSheet(
      isScrollControlled: true,
      Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                AccountActions.deleteAccountWarning,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoginRegisterButton(
                      onPressed: () => Get.back(),
                      height: Get.height / 16.8,
                      width: Get.width / 3.6,
                      child: const Text(LoadMoneyMessages.goBack)),
                  LoginRegisterButton(
                      onPressed: () => [
                            deleteAccountData(),
                            auth.signOut(),
                            Get.back(canPop: true),
                          ],
                      height: Get.height / 16.8,
                      width: Get.width / 3.6,
                      child: const Text(AccountActions.deleteAccount)),
                ],
              )
            ],
          )));
}
