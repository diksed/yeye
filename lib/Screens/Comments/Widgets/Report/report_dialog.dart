import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yeye/Constants/app_texts.dart';

import '../../../../Common/utils.dart';
import '../../../../Models/report_model.dart';
import '../../../../Service/firebase.dart';

Future<void> reportShowDialog(
    BuildContext context, String reportedEmail, int value) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return ReportAlertDialog(reportedEmail: reportedEmail, value: value);
    },
  );
}

class ReportAlertDialog extends StatefulWidget {
  const ReportAlertDialog(
      {super.key, required this.reportedEmail, required this.value});
  final String reportedEmail;
  final int value;

  @override
  State<ReportAlertDialog> createState() => _ReportAlertDialogState();
}

class _ReportAlertDialogState extends State<ReportAlertDialog> {
  var textfieldController = TextEditingController();
  var reportText = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: const Text(WarningMessages.reportUser),
      content: TextField(
        onChanged: (value) {
          setState(() {
            reportText = value;
          });
        },
        controller: textfieldController,
        decoration: const InputDecoration(
          hintText: 'Raporunuzu yazınız',
          hintMaxLines: 2,
          contentPadding: EdgeInsets.only(left: 5, top: 11, right: 15),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(LoadMoneyMessages.goBack)),
        TextButton(
            onPressed: () {
              if (reportText.isNotEmpty) {
                final report = ReportModel(
                    reporterEmail: auth.currentUser!.email,
                    reportedEmail: widget.reportedEmail,
                    reason: reportText,
                    reportedTime: Timestamp.now());
                if (widget.value == 1) {
                  createReport(report);
                  Utils.showSnackBar(WarningMessages.reported);
                } else if (widget.value == 2) {
                  createReport(report);
                  Utils.showSnackBar(WarningMessages.reportedAndBlocked);
                  firestore
                      .collection('users')
                      .doc('createdUsers')
                      .collection('allUsers')
                      .doc(auth.currentUser!.uid)
                      .update({
                    'myBlocked': FieldValue.arrayUnion([widget.reportedEmail]),
                  });
                }
                Navigator.of(context).pop();
              }
            },
            child: const Text(AccountActions.send)),
      ],
    );
  }
}

Future createReport(ReportModel report) async {
  final docRating = firestore.collection('report').doc();

  final json = report.toMap();

  await docRating.set(json);
}
