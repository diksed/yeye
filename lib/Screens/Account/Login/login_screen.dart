import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Common/display_size.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          decoration: accountGradientBoxDecoration(),
          height: displayHeight(context),
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
                    PasswordTextField(
                      passwordVisible: authController.passwordVisible,
                      passwordController: authController.passwordController,
                    ),
                    const ForgotPasswordButton(),
                    LoginRegisterButton(
                      width: displayWidth(context) / 1.5,
                      height: displayHeight(context) / 13,
                      onPressed: () => authController.signIn(),
                      child: const Text('Giriş Yap',
                          style: TextStyle(fontSize: 23)),
                    ),
                    LoginRegisterTextButton(
                      text: 'Hesabın yok mu? ',
                      textButton: 'Kayıt Ol',
                      onClicked: authController.isLogin.toggle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
