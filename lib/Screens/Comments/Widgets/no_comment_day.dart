import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Announcement/Widgets/Texts/default_announcement_text.dart';

class NoCommentDay extends StatelessWidget {
  const NoCommentDay({
    super.key,
    required this.textFirst,
    required this.textSecond,
    required this.textThird,
    required this.height,
  });

  final double height;

  final String textFirst;
  final String textSecond;
  final String textThird;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: Get.width / 1.37,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.values[2],
          children: [
            const Icon(Icons.search_off, color: Colors.black, size: 150),
            DefaultAnnouncementText(
                text: textFirst,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold),
            DefaultAnnouncementText(
                text: textSecond, textAlign: TextAlign.center),
            DefaultAnnouncementText(
                text: textThird,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}
