import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_button.dart';
import 'package:yeye/Screens/Account/Widgets/TextFields/check_spam_text.dart';
import '../../../Common/logo_box.dart';
import '../Widgets/Decorations/box_decorations.dart';
import '../Widgets/TextFields/mail_text_field.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      init: ForgotPasswordController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              decoration: accountGradientBoxDecoration(),
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const LogoSizedBox(),
                  Container(
                    width: Get.width,
                    height: Get.height / 1.7,
                    decoration: accountBoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.arrow_left, size: 30),
                              Text(AccountActions.goBack, style: TextStyle())
                            ],
                          ),
                        ),
                        MailTextField(
                            emailController: controller.emailController),
                        const CheckSpamFieldError(),
                        Obx(
                          () => LoginRegisterButton(
                            width: Get.width / 1.5,
                            height: Get.height / 13,
                            isActive: controller.isButtonActive.value,
                            onPressed: controller.resetPassword,
                            text: AccountActions.resetPassword,
                            textFontSize: 23,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
