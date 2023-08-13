import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String userEmail;
  RxBool isEmailVerified = false.obs;
  RxBool canResendEmail = false.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    userEmail = auth.currentUser!.email!;
    isEmailVerified.value = auth.currentUser!.emailVerified;
    if (!isEmailVerified.value) {
      sendVerificationEmail();

      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  Future<void> checkEmailVerified() async {
    await auth.currentUser!.reload();
    isEmailVerified.value = auth.currentUser!.emailVerified;
    if (isEmailVerified.value) timer?.cancel();
    update();
  }

  Future<void> sendVerificationEmail() async {
  try {
    final user = auth.currentUser!;
    user.sendEmailVerification();
    canResendEmail.value = false;
    update();
    await Future.delayed(const Duration(seconds: 10));
    canResendEmail.value = true;
    update();
  } catch (_) {}
}


  Future<void> signOutAndNavigateToLogin() async {
    await auth.signOut();
    Get.offAllNamed('/login');
  }

  void cancelResendEmail() {
    timer?.cancel();
    canResendEmail.value = true;
    update();
  }
}