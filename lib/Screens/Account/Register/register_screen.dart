import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_button.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_text_button.dart';
import '../../../Common/logo_box.dart';
import '../Auth/auth_controller.dart';
import '../Widgets/AlertDialogs/user_agreement_dialog.dart';
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
                      Obx(
                        () => SizedBox(
                          width: Get.width / 1.4,
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
                              authController.universityController.text = value!;
                              authController.university = value.obs;
                              authController.campus = authController
                                  .faculties[authController.university]![0].obs;
                            },
                          ),
                        ),
                      ),
                      Obx(
                        () => IgnorePointer(
                          ignoring: authController.campusButton.value,
                          child: SizedBox(
                            width: Get.width / 1.4,
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
                        height: Get.height / 19.51,
                        width: Get.width / 1.4,
                        child: Obx(
                          () => TextFormField(
                            controller: authController.passwordController,
                            obscureText: !authController.passwordVisible.value,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => Checkbox(
                              value: authController.acceptedTerms.value,
                              onChanged: (value) {
                                authController.acceptedTerms.value = value!;
                              },
                            ),
                          ),
                          InkWell(
                            child: const Text(
                              AccountActions.userAgreement,
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () {
                              agreementLauncher(LoadMoneyMessages.agreementUrl);
                            },
                          ),
                          SizedBox(width: Get.width / 36),
                          const Text(AccountActions.accept),
                        ],
                      ),
                      LoginRegisterButton(
                        width: Get.width / 1.4,
                        height: Get.height / 13,
                        onPressed: () => authController.signUpShowDialog(),
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
