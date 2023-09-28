import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
    await fetchRemoteConfig();
    var packageInfo = await PackageInfo.fromPlatform();
    var connectivityResult = await Connectivity().checkConnectivity();
    var maintenanceMode = remoteConfig.getBool("maintenance_mode");
    String version = remoteConfig.getString("app_version");

    if (connectivityResult == ConnectivityResult.none) {
      Get.offAllNamed('/splash-internet-connection');
    } else {
      if (packageInfo.version != version) {
        Get.offAllNamed('/update');
      } else {
        if (maintenanceMode) {
          Get.offAllNamed('/maintenance');
        } else {
          Get.offAllNamed('/home');
        }
      }
    }
  }
}
