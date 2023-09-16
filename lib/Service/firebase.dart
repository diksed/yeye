import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yeye/Constants/app_texts.dart';

import '../Common/utils.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

getCurrentUser() {
  final User user = auth.currentUser!;
  final email = user.email.toString();
  return email;
}

void handleFirebaseAuthException(FirebaseAuthException e) {
  if (e.code == 'user-not-found') {
    Utils.showSnackBar(WarningMessages.userNotFound);
  } else if (e.code == 'wrong-password' || e.code == 'wrong-email') {
    Utils.showSnackBar(WarningMessages.wrongPasswordEmail);
  } else if (e.code == 'user-disabled') {
    Utils.showSnackBar(WarningMessages.disabledUser);
  } else if (e.code == 'too-many-requests') {
    Utils.showSnackBar(WarningMessages.tooManyRequests);
  } else if (e.code == 'invalid-email') {
    Utils.showSnackBar(WarningMessages.invalidEmail);
  } else if (e.code == 'user-mitmatch') {
    Utils.showSnackBar(WarningMessages.userMismatch);
  } else {
    Utils.showSnackBar(WarningMessages.unknownError);
  }
}
