import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> currentUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((user) {
      currentUser.value = user;
      if (user == null) {
        Get.offAllNamed('/login');
      } else {
        Get.offAllNamed('/menu');
      }
    });
  }
}
