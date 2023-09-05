import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  final String email;
  late final String password;
  late final String uid;
  final String comment;

  CommentModel({
    required this.comment,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'timeStamp': Timestamp.now(),
      'email': email,
      'comment': comment,
    };
  }

  toTurn(CommentModel comment) {
    return comment;
  }

  CommentModel.fromMap(DocumentSnapshot<Map<String, dynamic>> doc)
      : email = doc['email'],
        comment = doc['comment'];
}
