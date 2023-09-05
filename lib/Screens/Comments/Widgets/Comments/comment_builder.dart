import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/box_decorations.dart';
import '../../../../Common/display_size.dart';
import '../../../../Constants/app_colors.dart';
import '../../../../Models/comments_model.dart';
import '../Report/report_block_button.dart';
import 'comment_email_fixer.dart';
import 'comment_height_calculator.dart';

class CommentBuilder extends StatelessWidget {
  const CommentBuilder({
    super.key,
    required this.currentUser,
    required this.comment,
  });

  final User? currentUser;
  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    final commentLength = comment.comment.length;
    final commentHeight = calculateCommentHeight(commentLength);
    final shortEmail = shortenEmail(comment.email);

    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Align(
          child: Container(
            height: commentHeight,
            width: Get.width / 1.52,
            decoration:
                customBoxDecoration(10, AppColors.cardColor, Colors.black, 0.1),
            child: Row(
              children: [
                SizedBox(width: Get.width / 41.1),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: Get.width / 2.05,
                        child: Text(
                          shortEmail,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 1.86,
                        child: Text(
                          comment.comment,
                          style: const TextStyle(color: AppColors.blackShade),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: currentUser!.email == comment.email ? false : true,
                  child: SizedBox(
                    height: displayHeight(context) / 34.15,
                    width: displayWidth(context) / 20.55,
                    child: ReportAndBlockButton(email: comment.email),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
