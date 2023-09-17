import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';

import '../../Models/delete_user_model.dart';
import '../../Service/firebase.dart';
import 'delete_user_controller.dart';

class ProfileController extends GetxController {
  RxMap<String, dynamic> profileData = RxMap({});
  RxList<String> blockedAccounts = <String>[].obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool canBeDeleted = false.obs;

  @override
  void onInit() {
    super.onInit();

    emailController.text = auth.currentUser!.email!;

    passwordController.addListener(() {
      if (passwordController.text.length >= 6) {
        canBeDeleted.value = true;
      } else {
        canBeDeleted.value = false;
      }
    });
  }

  Future<void> refreshUser() async {
    final user = auth.currentUser;
    final credential = EmailAuthProvider.credential(
        email: emailController.text, password: passwordController.text);
    await user!.reauthenticateWithCredential(credential);
    Get.dialog(
      Center(child: Image.asset(AppTexts.loadingImage)),
      barrierDismissible: false,
    );
    try {
      deleteUser(DeleteUserModel(
          uid: user.uid, email: user.email, deletedAt: Timestamp.now()));
      await user.delete();
      await Future.delayed(const Duration(seconds: 2));
      firestore
          .collection('users')
          .doc('createdUsers')
          .collection('allUsers')
          .doc(user.uid)
          .delete();
      Get.back(canPop: true);
    } on FirebaseAuthException catch (e) {
      Get.back();
      handleFirebaseAuthException(e);
    }
  }

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
