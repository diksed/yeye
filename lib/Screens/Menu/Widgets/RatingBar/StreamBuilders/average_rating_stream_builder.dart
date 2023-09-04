import 'package:flutter/material.dart';
import 'package:yeye/Models/rating_model.dart';

import '../custom_rating_bar_indicator.dart';

class AverageRatingStreamBuilder extends StatefulWidget {
  const AverageRatingStreamBuilder({super.key, this.ratingStream});

  final dynamic ratingStream;

  @override
  State<AverageRatingStreamBuilder> createState() =>
      _AverageRatingStreamBuilderState();
}

class _AverageRatingStreamBuilderState
    extends State<AverageRatingStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RatingModel>>(
      stream: widget.ratingStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final ratings = snapshot.data!;
          if (ratings.isEmpty) {
            return const CustomRatingBarIndicator(rating: 0.0);
          } else {
            double totalRating = 0;
            for (final rating in ratings) {
              totalRating += rating.rating;
            }
            double averageRating = totalRating / ratings.length;
            return CustomRatingBarIndicator(rating: averageRating);
          }
        } else {
          return const CustomRatingBarIndicator(rating: 0.0);
        }
      },
    );
  }
}
