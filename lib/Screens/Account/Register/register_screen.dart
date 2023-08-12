import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_button.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_text_button.dart';

import '../../../Common/display_size.dart';
import '../../../Common/logo_box.dart';
import '../../../Common/utils.dart';
import '../Auth/auth_controller.dart';
import '../Widgets/Decorations/box_decorations.dart';
import '../Widgets/TextFields/mail_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final VoidCallback onClickedLogin;

  RegisterScreen({Key? key, required this.onClickedLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: Utils.messengerKey,
      child: Form(
        child: Scaffold(
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: displayHeight(context) / 28.45),
                        MailTextField(
                            emailController: authController.emailController),
                        LoginRegisterButton(
                          width: displayWidth(context) / 1.5,
                          height: displayHeight(context) / 13,
                          onPressed: () => authController.signUpShowDialog(
                            authController.formKey,
                            context,
                            authController.emailController,
                            authController.passwordController,
                            authController.universityController,
                            authController.campusController,
                          ),
                          child: const Text(
                            AccountActions.register,
                            style: TextStyle(fontSize: 23),
                          ),
                        ),
                        LoginRegisterTextButton(
                          text: AccountActions.alreadyHaveAnAccount,
                          textButton: AccountActions.login,
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
      ),
    );
  }
}
