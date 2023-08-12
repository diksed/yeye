import 'package:flutter/material.dart';

import '../../../../Common/display_size.dart';

class MailTextField extends StatelessWidget {
  const MailTextField({Key? key, required this.emailController})
      : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: displayHeight(context) / 19.51,
      width: displayWidth(context) / 1.5,
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
