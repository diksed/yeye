import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementModel {
  final String announcement;

  AnnouncementModel({
    required this.announcement,
  });

  Map<String, dynamic> toMap() {
    return {
      'announcement': announcement,
    };
  }

  AnnouncementModel.fromMap(DocumentSnapshot<Map<String, dynamic>> doc)
      : announcement = doc['announcement'];
}
