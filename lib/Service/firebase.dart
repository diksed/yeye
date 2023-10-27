import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Menu/menu_controller.dart';

import '../Common/utils.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

getCurrentUser() {
  final User user = auth.currentUser!;
  final email = user.email.toString();
  return email;
}

Future<List<RxString>> getUniversityData() async {
  QuerySnapshot querySnapshot =
      await firestore.collection('universities').get();
  List<RxString> documentUniversity = [];

  for (QueryDocumentSnapshot document in querySnapshot.docs) {
    documentUniversity.add(document.id.obs);
  }
  return documentUniversity;
}

Future<String> getLoadMoneyLink() async {
  final university = await getSpecificData(UserFields.university);

  final doc = await firestore.collection('universities').doc(university).get();



  return doc['load_money_link'];
}

Future<Map<String, List<String>>> getFacultyData() async {
  QuerySnapshot querySnapshot =
      await firestore.collection('universities').get();
  Map<String, List<String>> documentUniversity = {};

  for (QueryDocumentSnapshot document in querySnapshot.docs) {
    documentUniversity[document.id] = List.from(document['refectories']);
  }
  return documentUniversity;
}

Future<List<String>> getUniversityMailData() async {
  QuerySnapshot querySnapshot =
      await firestore.collection('universities').get();
  List<String> documentUniversity = [];

  for (QueryDocumentSnapshot document in querySnapshot.docs) {
    documentUniversity.add(document['mail']);
  }
  return documentUniversity;
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
  } else if (e.code == 'email-already-in-use') {
    Utils.showSnackBar(WarningMessages.emailAlreadyInUse);
  } else if (e.code == 'user-mitmatch') {
    Utils.showSnackBar(WarningMessages.userMismatch);
  } else {
    Utils.showSnackBar(WarningMessages.unknownError);
  }
}
