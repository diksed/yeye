import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Login/login_screen.dart';

class PasswordTextField extends StatelessWidget {
  final RxBool passwordVisible;
  final TextEditingController passwordController;

  const PasswordTextField({
    Key? key,
    required this.passwordVisible,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: displayHeight(context) / 19.51,
      width: displayWidth(context) / 1.5,
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
