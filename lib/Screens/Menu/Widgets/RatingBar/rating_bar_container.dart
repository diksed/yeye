import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Common/display_size.dart';
import 'package:yeye/Common/time_for_calendar.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Models/rating_model.dart';
import 'package:yeye/Screens/Menu/Widgets/RatingBar/RatingButton/rating_button.dart';

import 'StreamBuilders/average_rating_stream_builder.dart';
import 'StreamBuilders/average_text_stream_builder.dart';

class RatingBarContainer extends StatefulWidget {
  const RatingBarContainer({
    super.key,
    required this.ratingStream,
    required this.ratingVisible,
  });

  final Stream<List<RatingModel>> ratingStream;
  final RxBool ratingVisible;

  @override
  State<RatingBarContainer> createState() => _RatingBarContainerState();
}

class _RatingBarContainerState extends State<RatingBarContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: displayWidth(context) / 1.17,
      child: Column(
        children: [
          SizedBox(height: displayHeight(context) / 136.6),
          AverageRatingStreamBuilder(ratingStream: widget.ratingStream),
          SizedBox(height: displayHeight(context) / 341.5),
          AverageTextStreamBuilder(ratingStream: widget.ratingStream),
          SizedBox(height: displayHeight(context) / 136.6),
          StreamBuilder<List<RatingModel>>(
            stream: widget.ratingStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final ratings = snapshot.data!;
                if (ratings.isNotEmpty) {
                  return Text(
                      '${ratings.length} ${AnnouncementMessages.peopleRating}');
                } else {
                  return const Text(AnnouncementMessages.noRating);
                }
              } else {
                return const Text(WarningMessages.somethingWrong);
              }
            },
          ),
          SizedBox(height: displayHeight(context) / 136.6),
          Obx(() => RatingButton(
              visible: widget.ratingVisible.value, today: currentDate)),
        ],
      ),
    );
  }
}
