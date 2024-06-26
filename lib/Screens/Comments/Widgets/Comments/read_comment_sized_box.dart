import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Models/comments_model.dart';
import '../../../../Service/firebase.dart';
import 'comment_builder.dart';

class ReadCommentSizedBox extends StatelessWidget {
  const ReadCommentSizedBox({
    super.key,
    required this.comments,
    required this.sizedBoxHeight,
  });

  final List<CommentModel> comments;
  final double sizedBoxHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizedBoxHeight,
      width: Get.width / 1.37,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: comments
            .map((comment) => CommentBuilder(
                  comment: comment,
                  currentUser: auth.currentUser,
                ))
            .toList(),
      ),
    );
  }
}
