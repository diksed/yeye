import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Comments/Widgets/MakeComment/make_comment_card.dart';
import 'package:yeye/Service/firebase.dart';

import '../../Common/box_decorations.dart';
import '../../Common/logo_box.dart';
import '../../Common/text_styles.dart';
import '../../Common/time_for_calendar.dart';
import '../../Models/comments_model.dart';
import '../Announcement/Widgets/default_announcement.dart';
import 'Widgets/MakeComment/line_in_comment_card.dart';
import 'Widgets/no_comment_day.dart';
import 'Widgets/Comments/read_comment_sized_box.dart';
import 'comments_controller.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final CommentsScreenController controller =
      Get.put(CommentsScreenController());

  @override
  void initState() {
    super.initState();
    final commentDate = DateFormat('dd-MM-yyyy').format(currentTime);
    controller.commentDate.value = commentDate;
    controller.fetchComments(commentDate);
    controller.fetchBlockedComments();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              Get.focusScope!.unfocus();
            },
            child: Center(
              child: Column(
                children: [
                  LogoSizedBox(
                    height: Get.height / 3,
                    width: Get.width / 3,
                  ),
                  Text(TitleMessages.comments, style: titleTextStyle()),
                  SizedBox(height: Get.height / 136.6),
                  GestureDetector(
                    onTap: () async {
                      controller.onDateSelected(context);
                    },
                    child: Obx(() => Container(
                          height: Get.height / 17,
                          width: Get.width / 3.04,
                          decoration: dateInsideContainerDecoration(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.calendar_month,
                                  color: Colors.white),
                              Row(
                                children: [
                                  Text(controller.commentDate.value,
                                      style:
                                          const TextStyle(color: Colors.white))
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: Get.height / 68.3),
                  StreamBuilder<List<CommentModel>>(
                    stream: controller.commentListStream.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<CommentModel> commentSnapshot = snapshot.data!;
                        firestore
                            .collection('users')
                            .doc('createdUsers')
                            .collection('allUsers')
                            .doc(auth.currentUser!.uid)
                            .snapshots()
                            .listen((snapshot) {
                          if (snapshot.exists) {
                            List<dynamic> myBlocked =
                                snapshot.data()!['myBlocked'] ?? [];
                            controller.blockedSnapshot.value = commentSnapshot
                                .where((comment) =>
                                    !myBlocked.contains(comment.email))
                                .toList();
                          }
                        });
                        if (commentSnapshot.isEmpty) {
                          if (controller.commentDate.value == currentDate) {
                            return SizedBox(
                              height: controller.listViewHeight(),
                              width: Get.width / 1.37,
                              child: DefaultAnnouncement(
                                  height: Get.height / 4.01,
                                  textFirst:
                                      AnnouncementMessages.noCommentToday,
                                  textSecond:
                                      AnnouncementMessages.makeCommentAboutFood,
                                  textThird: AnnouncementMessages
                                      .makeCommentAboutFood2,
                                  textFourth:
                                      AnnouncementMessages.makeFirstComment,
                                  firstLogoVisible: false,
                                  secondLogoVisible: false),
                            );
                          } else {
                            return SizedBox(
                              height: controller.listViewHeight.value,
                              width: Get.width / 1.37,
                              child: NoCommentDay(
                                  height: Get.height / 1.43,
                                  textFirst:
                                      '${controller.commentDate} ${AnnouncementMessages.date}',
                                  textSecond:
                                      AnnouncementMessages.anythingComment,
                                  textThird:
                                      AnnouncementMessages.didntMakeComment),
                            );
                          }
                        } else {
                          return StreamBuilder<List<CommentModel>>(
                            builder: (context, snapshot) {
                              return Obx(
                                () => ReadCommentSizedBox(
                                  comments: controller.blockedSnapshot,
                                  sizedBoxHeight:
                                      controller.listViewHeight.value,
                                ),
                              );
                            },
                            stream: controller.blockedSnapshot.stream,
                          );
                        }
                      } else {
                        return Center(
                            child: Image.asset(AppTexts.loadingImage));
                      }
                    },
                  ),
                  SizedBox(height: Get.height / 136.6),
                  Obx(
                    () => Visibility(
                      visible: controller.commentDate.value == currentDate
                          ? true
                          : false,
                      child: LineInCommentCard(
                          color: Colors.black, width: Get.width / 2.4),
                    ),
                  ),
                  SizedBox(height: Get.height / 68.3),
                  Obx(
                    () => Visibility(
                      visible: controller.commentDate.value == currentDate &&
                              controller.isCommented.value == false
                          ? true
                          : controller.isCommented.value == true
                              ? false
                              : true,
                      child: MakeCommentCard(
                          controllerComment: controller.controllerComment,
                          shareComment: () => controller.shareComment()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
