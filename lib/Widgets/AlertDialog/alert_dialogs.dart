import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Account/Widgets/AlertDialogs/user_agreement_dialog.dart';
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

Future<void> loadMoneyAlertDialog(
    String title, String content, String buttonText, String url) {
  return Get.dialog(CustomAlertDialog(
      titleText: title,
      contentText: content,
      buttonText: buttonText,
      onPressed: () => agreementLauncher(url)));
}
