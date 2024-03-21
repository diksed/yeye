import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordTextField extends StatelessWidget {
  final RxBool passwordVisible;
  final TextEditingController passwordController;

  const PasswordTextField({
    super.key,
    required this.passwordVisible,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 19.51,
      width: Get.width / 1.4,
      child: Obx(() {
        return TextFormField(
          controller: passwordController,
          obscureText: !passwordVisible.value,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: 'Şifre',
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: IconButton(
              splashColor: Colors.transparent,
              icon: Icon(
                passwordVisible.value
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                passwordVisible.value = !passwordVisible.value;
              },
            ),
          ),
        );
      }),
    );
  }
}
