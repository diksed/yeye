import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Models/delete_user_model.dart';
import '../../Service/firebase.dart';

Future deleteUser(DeleteUserModel deleteUser) async {
  final docDelete = firestore
      .collection('users')
      .doc('deletedUsers')
      .collection('allUsers')
      .doc(auth.currentUser!.email);

  final json = deleteUser.toMap();

  await docDelete.set(json);
}

Future<void> deleteAccountData() async {
  final user = auth.currentUser;
  try {
    deleteUser(DeleteUserModel(
        uid: auth.currentUser!.uid,
        email: auth.currentUser!.email,
        deletedAt: Timestamp.now()));
    var userUid = auth.currentUser!.uid;
    user?.delete();
    await Future.delayed(const Duration(seconds: 2));
    firestore
        .collection('users')
        .doc('createdUsers')
        .collection('allUsers')
        .doc(userUid)
        .delete();
  } catch (_) {}
}