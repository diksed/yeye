import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {
  final String? reporterEmail;
  final String reportedEmail;
  final String reason;
  late Timestamp reportedTime;

  ReportModel({
    required this.reporterEmail,
    required this.reportedEmail,
    required this.reason,
    required this.reportedTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'reporterEmail': reporterEmail,
      'reportedEmail': reportedEmail,
      'reason': reason,
      'reportedTime': reportedTime,
    };
  }

  ReportModel.fromMap(DocumentSnapshot<Map<String, dynamic>> doc)
      : reporterEmail = doc['reporterEmail'],
        reportedEmail = doc['reportedEmail'],
        reason = doc['reason'],
        reportedTime = doc['reportedTime'];
}
