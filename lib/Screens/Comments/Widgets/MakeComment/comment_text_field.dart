import 'package:flutter/material.dart';
import 'package:yeye/Constants/app_texts.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({
    super.key,
    required this.controllerComment,
  });

  final TextEditingController controllerComment;

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLength: 100,
      textInputAction: TextInputAction.done,
      maxLines: null,
      controller: controllerComment,
      decoration: const InputDecoration(
        hintText: WarningMessages.writeYourComment,
        hintMaxLines: 2,
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 15, top: 11, right: 15),
      ),
    );
  }
}
