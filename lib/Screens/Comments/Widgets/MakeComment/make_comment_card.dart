import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Common/box_decorations.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Comments/Widgets/MakeComment/line_in_comment_card.dart';

import 'comment_text_field.dart';

class MakeCommentCard extends StatefulWidget {
  const MakeCommentCard(
      {super.key, required this.controllerComment, required this.shareComment});
  final TextEditingController controllerComment;
  final Function() shareComment;

  @override
  State<MakeCommentCard> createState() => _MakeCommentCardState();
}

class _MakeCommentCardState extends State<MakeCommentCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Get.height / 5.49,
        width: Get.width / 1.17,
        decoration: customBoxDecoration(
            10, AppColors.cardColor, Colors.blueAccent, 0.1),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 9.75,
              width: Get.width / 1.17,
              child: CommentTextField(
                controllerComment: widget.controllerComment,
              ),
            ),
            LineInCommentCard(color: Colors.grey, width: Get.width / 1.52),
            TextButton(
                onPressed: widget.shareComment,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black, enableFeedback: false),
                child: const Text(AppTexts.shareComment))
          ],
        ),
      ),
    );
  }
}
