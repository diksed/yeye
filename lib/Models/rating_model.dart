import 'package:cloud_firestore/cloud_firestore.dart';

class RatingModel {
  final String email;
  final double rating;

  RatingModel({
    required this.email,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'rating': rating,
    };
  }

  RatingModel.fromMap(DocumentSnapshot<Map<String, dynamic>> doc)
      : email = doc['email'],
        rating = doc['rating'];
}
