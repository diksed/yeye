import 'package:flutter/material.dart';

import '../../../../../Models/rating_model.dart';
import '../empty_rating_text.dart';

class AverageTextStreamBuilder extends StatefulWidget {
  const AverageTextStreamBuilder({super.key, this.ratingStream});

  final dynamic ratingStream;

  @override
  State<AverageTextStreamBuilder> createState() =>
      _AverageTextStreamBuilderState();
}

class _AverageTextStreamBuilderState extends State<AverageTextStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RatingModel>>(
      stream: widget.ratingStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final ratings = snapshot.data!;
          if (ratings.isEmpty) {
            return const EmptyRatingText();
          } else {
            double totalRating = 0;
            for (final rating in ratings) {
              totalRating += rating.rating;
            }
            double averageRating = totalRating / ratings.length;
            return Text(
              averageRating.toStringAsFixed(1),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            );
          }
        } else {
          return const EmptyRatingText();
        }
      },
    );
  }
}
