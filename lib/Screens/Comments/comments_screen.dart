import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yeye/Common/utils.dart';
import 'package:yeye/Constants/app_texts.dart';
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
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final CommentsScreenController controller =
      Get.put(CommentsScreenController());

  @override
  void initState() {
    super.initState();
    controller.commentDate.value = DateFormat('dd-MM-yyyy').format(currentTime);
    controller.fetchComments(controller.commentDate.value);
    controller.fetchBlockedComments();
  }

  @override
  Widget build(BuildContext context) {
    Stream<List<CommentModel>> commentListStream =
        controller.commentListStream.stream;
    return SafeArea(
      child: ScaffoldMessenger(
        key: Utils.commentsMessengerKey,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                Get.focusScope!.unfocus();
              },
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
                  StreamBuilder(
                    stream: commentListStream,
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
                              height: controller.listViewHeight(),
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
                              return ReadCommentSizedBox(
                                comments: controller.blockedSnapshot,
                                sizedBoxHeight: controller.listViewHeight(),
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
                  const LineInCommentCard(color: Colors.black, width: 150),
                  SizedBox(height: Get.height / 68.3),
                  Container(height: Get.height / 5.49)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
