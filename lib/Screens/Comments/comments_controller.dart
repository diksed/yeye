import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:profanity_filter/profanity_filter.dart';
import 'package:yeye/Common/calculator_functions.dart';
import 'package:yeye/Common/utils.dart';
import 'package:yeye/Constants/app_texts.dart';

import '../../Common/time_for_calendar.dart';
import '../../Models/comments_model.dart';
import '../../Service/firebase.dart';
import '../Menu/menu_controller.dart';

class CommentsScreenController extends GetxController {
  final RxString commentDate = ''.obs;
  final RxList<String> comments = <String>[].obs;
  final TextEditingController controllerComment = TextEditingController();
  final RxBool isCommented = false.obs;
  final RxDouble listViewHeight = (Get.height / 2.43).obs;
  late List<CommentModel> commentSnapshot = <CommentModel>[];
  final filter = ProfanityFilter();

  RxList<CommentModel> commentListStream = <CommentModel>[].obs;
  RxList<CommentModel> blockedSnapshot = <CommentModel>[].obs;

  void fetchComments(String date) async {
    final university = await getSpecificData(UserFields.university);
    final campus = await getSpecificData(UserFields.campus);

    firestore
        .collection('universities')
        .doc(university)
        .collection('campuses')
        .doc(campus)
        .collection(collectionDateForAll)
        .doc('comments')
        .collection(date)
        .orderBy('timeStamp', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => CommentModel.fromMap(doc)).toList())
        .listen((data) {
      commentListStream.value = data;
    });
  }

  void fetchBlockedComments() async {
    final snapshot = await firestore
        .collection('users')
        .doc('createdUsers')
        .collection('allUsers')
        .doc(auth.currentUser!.uid)
        .get();

    if (snapshot.exists) {
      final myBlocked = snapshot.data()!['myBlocked'] ?? [];
      final commentSnapshot = commentListStream;

      final blockedComments = commentSnapshot
          .where((comment) => !myBlocked.contains(comment.email))
          .toList();

      blockedSnapshot.value = blockedComments;
    }
  }

  void shareComment() async {
    if (controllerComment.text.isNotEmpty) {
      if (filter.hasProfanity(controllerComment.text)) {
        Utils.showSnackBar(WarningMessages.noSwear);
      } else {
        final comment = CommentModel(
          comment: controllerComment.text,
          email: getCurrentUser().toString(),
        );
        createComment(comment, currentDate, collectionDateForCurrentTime);
        controllerComment.clear();
        isCommented.value = true;
        listViewHeight.value = Get.height / 1.5627;

        Get.back();
      }
    } else {
      Utils.showSnackBar(WarningMessages.writeComment);
    }
  }

  Future createComment(
      CommentModel comment, String formattedDate, String collectionDate) async {
    final university = await getSpecificData(UserFields.university);
    final campus = await getSpecificData(UserFields.campus);
    final docUser = firestore
    .collection('universities')
    .doc(university)
        .collection('campuses')
        .doc(campus)
        .collection(collectionDateForCurrentTime)
        .doc('comments')
        .collection(formattedDate)
        .doc(comment.email);

    final json = comment.toMap();
    await docUser.set(json);
  }

  void onDateSelected(BuildContext context) async {
    DateTime? pickedDate = await selectDate(context, currentTime);
    if (pickedDate != null) {
      commentDate.value = DateFormat('dd-MM-yyyy').format(pickedDate);
      fetchComments(commentDate.value);
      fetchBlockedComments();
      listViewHeight.value =
          calculateListViewHeight(commentDate.value, isCommented.value);
    }
  }
}
