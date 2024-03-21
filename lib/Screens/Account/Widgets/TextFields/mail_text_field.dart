import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MailTextField extends StatelessWidget {
  const MailTextField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 19.51,
      width: Get.width / 1.4,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          hintText: 'Okul Maili',
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: Icon(Icons.email_outlined),
        ),
      ),
    );
  }
}
