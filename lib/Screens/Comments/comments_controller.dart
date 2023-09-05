import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yeye/Constants/app_texts.dart';

import '../../Common/time_for_calendar.dart';
import '../../Models/comments_model.dart';
import '../../Service/firebase.dart';
import '../Menu/menu_controller.dart';

class CommentsScreenController extends GetxController {
  final RxString commentDate = ''.obs;
  final RxList<String> comments = <String>[].obs;

  RxList<CommentModel> commentListStream = <CommentModel>[].obs;
  RxList<CommentModel> blockedSnapshot = <CommentModel>[].obs;

  void fetchComments(String date) async {
    final university = await getSpecificData(UserFields.university);
    final campus = await getSpecificData(UserFields.campus);

    firestore
        .collection(university)
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

  void onDateSelected(BuildContext context) async {
    DateTime? pickedDate = await selectDate(context, endOfMonth);
    if (pickedDate != null) {
      commentDate.value = DateFormat('dd-MM-yyyy').format(pickedDate);
      fetchComments(commentDate.value);
      fetchBlockedComments();
    }
  }

  double listViewHeight() {
    if (currentDate.contains(commentDate)) {
      return Get.height / 2.43;
    } else {
      return Get.height / 1.62;
    }
  }
}
