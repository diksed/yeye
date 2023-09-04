import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../Service/firebase.dart';

class HomeController extends GetxController {

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());

    ever(user, (User? newUser) {
      if (newUser == null) {
        Get.offAllNamed('/auth');
      } else {
        if (!newUser.emailVerified) {
          Get.offAllNamed('/verify-email');
        } else {
          Get.offAllNamed('/bottom-nav-bar');
        }
      }
    });
  }

  RxBool get isLoading => false.obs;

  RxBool get hasError => false.obs;

  RxBool get hasData => true.obs;

  RxBool isSignedIn = false.obs;

  void signOut() async {
    await auth.signOut();
  }
}
