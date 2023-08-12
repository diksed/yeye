import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_button.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_text_button.dart';

import '../../../Common/display_size.dart';
import '../../../Common/logo_box.dart';
import '../Auth/auth_controller.dart';
import '../Widgets/Decorations/box_decorations.dart';
import '../Widgets/TextFields/mail_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final VoidCallback onClickedLogin;

  RegisterScreen({Key? key, required this.onClickedLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: authController.formKey,
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
                      SizedBox(
                        height: displayHeight(context) / 28.45,
                      ),
                      Obx(
                        () => SizedBox(
                          width: displayWidth(context) / 1.5,
                          child: DropdownButtonFormField(
                            icon: const Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Icon(Icons.arrow_drop_down),
                            ),
                            hint: const Text(AccountActions.selectUniversity,
                                style: TextStyle(color: Colors.grey)),
                            items: authController.universities
                                .map((RxString value) {
                              return DropdownMenuItem<String>(
                                value: value.value,
                                child: Text(value.value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              authController.campusButton.value = false;
                              authController.universityController.text =
                                  value!;
                              authController.university = value.obs;
                              authController.campus = authController
                                  .faculties[authController.university]![0]
                                  .obs;
                            },
                          ),
                        ),
                      ),
                      Obx(
                        () => IgnorePointer(
                          ignoring: authController.campusButton.value,
                          child: SizedBox(
                            width: displayWidth(context) / 1.5,
                            child: DropdownButtonFormField(
                              enableFeedback: false,
                              icon: const Padding(
                                padding: EdgeInsets.only(right: 12),
                                child: Icon(Icons.arrow_drop_down),
                              ),
                              hint: const Text(AccountActions.selectCampus,
                                  style: TextStyle(color: Colors.grey)),
                              items: authController
                                  .faculties[authController.university]!
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                authController.campusController.text = value!;
                                authController.campus = value.obs;
                              },
                            ),
                          ),
                        ),
                      ),
                      MailTextField(
                          emailController: authController.emailController),
                      SizedBox(
                        height: displayHeight(context) / 19.51,
                        width: displayWidth(context) / 1.5,
                        child: Obx(
                          () => TextFormField(
                            controller: authController.passwordController,
                            obscureText:
                                !authController.passwordVisible.value,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              hintText: AccountActions.least6Characters,
                              hintStyle: const TextStyle(color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  authController.passwordVisible.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  authController.passwordVisible.toggle();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
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
    );
  }
}
