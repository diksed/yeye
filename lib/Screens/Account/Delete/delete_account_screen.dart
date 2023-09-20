import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Common/logo_box.dart';
import 'package:yeye/Common/text_styles.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Account/Delete/delete_account_controller.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_button.dart';
import 'package:yeye/Screens/Account/Widgets/TextFields/mail_text_field.dart';
import 'package:yeye/Screens/Account/Widgets/TextFields/password_text_field.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final DeleteAccountController controller = Get.put(DeleteAccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => Get.focusScope!.unfocus(),
          child: Center(
            child: Column(
              children: [
                LogoSizedBox(height: Get.height / 3, width: Get.width / 3),
                Text(TitleMessages.deleteAccount, style: titleTextStyle()),
                SizedBox(height: Get.height / 22.4),
                Text(AccountActions.deleteAccountWarning,
                    style: titleTextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center),
                SizedBox(height: Get.height / 11.2),
                MailTextField(emailController: controller.emailController),
                SizedBox(height: Get.height / 33.6),
                PasswordTextField(
                    passwordVisible: false.obs,
                    passwordController: controller.passwordController),
                SizedBox(height: Get.height / 11.2),
                Obx(
                  () => LoginRegisterButton(
                      isActive: controller.canBeDeleted.value,
                      onPressed: () => controller.refreshUser(),
                      width: Get.width / 1.5,
                      height: Get.height / 13,
                      child: const Text(AccountActions.deleteAccount)),
                ),
                SizedBox(height: Get.height / 33.6),
                TextButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      AccountActions.giveUp,
                      style: TextStyle(
                          color: AppColors.calendarCardColor,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
