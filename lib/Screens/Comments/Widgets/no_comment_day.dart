import 'package:flutter/material.dart';

import '../../../Common/display_size.dart';
import '../../Announcement/Widgets/default_announcement_text.dart';

class NoCommentDay extends StatelessWidget {
  const NoCommentDay({
    Key? key,
    required this.textFirst,
    required this.textSecond,
    required this.textThird,
    required this.height,
  }) : super(key: key);

  final double height;

  final String textFirst;
  final String textSecond;
  final String textThird;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: displayWidth(context) / 1.37,
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
