import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:yeye/Service/maintenance.dart';

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
      Get.offAllNamed('/splash-internet-connection');
    } else {
      if (remoteConfig.getBool("maintenance_mode")) {
        Get.offAllNamed('/maintenance');
      } else {
        Get.offAllNamed('/home');
      }
    }
  }
}
