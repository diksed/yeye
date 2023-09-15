import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MailTextField extends StatelessWidget {
  const MailTextField({Key? key, required this.emailController})
      : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 19.51,
      width: Get.width / 1.5,
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
