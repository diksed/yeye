import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import '../../../Common/logo_box.dart';
import '../Auth/auth_controller.dart';
import '../Widgets/Buttons/forgot_password_button.dart';
import '../Widgets/Buttons/login_register_button.dart';
import '../Widgets/Buttons/login_register_text_button.dart';
import '../Widgets/Decorations/box_decorations.dart';
import '../Widgets/TextFields/mail_text_field.dart';
import '../Widgets/TextFields/password_text_field.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final VoidCallback? onClickedRegister;

  LoginScreen({super.key, this.onClickedRegister});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: authController.loginFormKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            decoration: accountGradientBoxDecoration(),
            height: Get.height,
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
                      SizedBox(height: Get.height / 28.45),
                      MailTextField(
                          emailController: authController.emailController),
                      PasswordTextField(
                        passwordVisible: authController.passwordVisible,
                        passwordController: authController.passwordController,
                      ),
                      const ForgotPasswordButton(),
                      LoginRegisterButton(
                        width: Get.width / 1.5,
                        height: Get.height / 13,
                        onPressed: () => authController.signIn(),
                        text: AccountActions.login,
                        textFontSize: 23,
                      ),
                      LoginRegisterTextButton(
                        text: AccountActions.dontHaveAccount,
                        textButton: AccountActions.register,
                        onClicked: authController.isLogin.toggle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
