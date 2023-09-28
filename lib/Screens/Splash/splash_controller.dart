import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Service/maintenance.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      checkParameters();
    });
  }

  Future<void> checkParameters() async {
    var packageInfo = await PackageInfo.fromPlatform();
    var connectivityResult = await Connectivity().checkConnectivity();
    var maintenanceMode =
        remoteConfig.getBool(RemoteParametres.maintenanceMode);
    var version = remoteConfig.getString(RemoteParametres.appVersion);

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
