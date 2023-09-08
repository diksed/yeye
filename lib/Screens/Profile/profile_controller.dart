import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../Service/firebase.dart';

class ProfileController extends GetxController {
  RxMap<String, dynamic> profileData = RxMap({});
  RxList<String> blockedAccounts = <String>[].obs;

  void fetchProfileData() {
    final profileStream = firestore
        .collection('users')
        .doc('createdUsers')
        .collection('allUsers')
        .doc(auth.currentUser!.uid)
        .snapshots();

    profileStream.listen((snapshot) {
      if (snapshot.exists) {
        profileData.value = snapshot.data() ?? {};
        blockedAccounts.value =
            List<String>.from(snapshot.data()!['myBlocked']);
      }
    });
  }

  void unblockAccount(int? index) {
    firestore
        .collection('users')
        .doc('createdUsers')
        .collection('allUsers')
        .doc(auth.currentUser!.uid)
        .update({
      'myBlocked': FieldValue.arrayRemove([blockedAccounts[index!]])
    });
  }
}
