import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Account/VerifyEmail/verify_email_controller.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_button.dart';
import 'package:yeye/Screens/Account/Widgets/TextFields/check_spam_text.dart';
import 'package:yeye/Widgets/BottomNavBar/bottom_nav_bar.dart';
import '../../../Common/logo_box.dart';
import '../Widgets/Decorations/box_decorations.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final VerifyEmailController controller = Get.put(VerifyEmailController());

  @override
  Widget build(BuildContext context) => Obx(
        () => controller.isEmailVerified.value
            ? BottomNavBar()
            : Scaffold(
                resizeToAvoidBottomInset: false,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                      children: [
                                        const TextSpan(
                                            text: AccountActions.receiveLink),
                                        TextSpan(
                                            text: controller.userEmail,
                                            style: const TextStyle(
                                                color: Colors.black)),
                                        const TextSpan(
                                            text: AccountActions.sentToMail),
                                      ])),
                              Obx(
                                () => LoginRegisterButton(
                                    height: Get.height / 13,
                                    width: Get.width / 1.5,
                                    onPressed: controller.canResendEmail.value
                                        ? controller.sendVerificationEmail
                                        : null,
                                    child: const Text(
                                        AccountActions.sentToMailAgain,
                                        style: TextStyle(fontSize: 16))),
                              ),
                              const CheckSpamFieldError(),
                              TextButton(
                                onPressed: controller.signOutAndNavigateToLogin,
                                child: const Text(AccountActions.cancel,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: AppColors.themeRedColor)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      );
}
