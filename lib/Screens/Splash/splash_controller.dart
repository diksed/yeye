import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      checkInternetConnection();
    });
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.offAllNamed('/internet-connection');
    } else {
      Get.offAllNamed('/home');
    }
  }
}
