import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final auth = FirebaseAuth.instance;

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());

    ever(user, (User? newUser) {
      if (newUser == null) {
        isSignedIn.value = false;
      } else {
        isSignedIn.value = true;
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
