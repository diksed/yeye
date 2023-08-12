import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Common/logo_box.dart';
import '../Widgets/Buttons/forgot_password_button.dart';
import '../Widgets/Buttons/login_register_button.dart';
import '../Widgets/Buttons/login_register_text_button.dart';
import '../Widgets/Decorations/box_decorations.dart';
import '../Widgets/TextFields/mail_text_field.dart';
import '../Widgets/TextFields/password_text_field.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

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
                    MailTextField(emailController: controller.emailController),
                    const SizedBox(height: 16),
                    PasswordTextField(
                      passwordVisible: controller.passwordVisible,
                      passwordController: controller.passwordController,
                    ),
                    const SizedBox(height: 16),
                    const ForgotPasswordButton(),
                    LoginRegisterButton(
                      width: displayWidth(context) / 1.5,
                      height: displayHeight(context) / 13,
                      onPressed: () => controller.signIn(),
                      child: const Text('Giriş Yap',
                          style: TextStyle(fontSize: 23)),
                    ),
                    const SizedBox(height: 16),
                    LoginRegisterTextButton(
                      text: 'Hesabın yok mu? ',
                      textButton: 'Kayıt Ol',
                      onClicked: controller.navigateToRegister,
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

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}
