import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_button.dart';
import 'package:yeye/Screens/Account/Widgets/TextFields/check_spam_text.dart';

import '../../../Common/display_size.dart';
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
              height: displayHeight(context),
              width: displayWidth(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LogoSizedBox(
                    appHeight: displayHeight(context),
                    appWidth: displayWidth(context),
                  ),
                  Container(
                    width: displayWidth(context),
                    height: displayHeight(context) / 1.7,
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
                        LoginRegisterButton(
                          width: displayWidth(context) / 1.5,
                          height: displayHeight(context) / 13,
                          onPressed: controller.resetPassword,
                          child: const Text(
                            AccountActions.resetPassword,
                            style: TextStyle(fontSize: 23),
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
