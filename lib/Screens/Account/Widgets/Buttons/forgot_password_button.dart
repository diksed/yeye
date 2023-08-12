import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/forgot_password');
      },
      child: Text(
        'Şifremi Unuttum',
        style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
