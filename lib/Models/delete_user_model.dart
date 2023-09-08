import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteUserModel {
  late String uid;
  late String? email;

  late Timestamp deletedAt;

  DeleteUserModel({
    required this.uid,
    this.email,
    required this.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'deletedAt': deletedAt,
    };
  }

  DeleteUserModel.fromMap(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc['uid'],
        email = doc['email'],
        deletedAt = doc['deletedAt'];
}
