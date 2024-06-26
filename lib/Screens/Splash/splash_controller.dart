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
    var kafiMode = remoteConfig.getBool(RemoteParametres.kafiMode);
    var version = remoteConfig.getString(RemoteParametres.appVersion);
    var developmentMode =
        remoteConfig.getBool(RemoteParametres.developmentMode);

    if (connectivityResult == ConnectivityResult.none) {
      Get.offAllNamed('/splash-internet-connection');
    } else {
      if (!developmentMode) {
        if (packageInfo.version != version) {
          Get.offAllNamed('/update');
        } else {
          if (kafiMode) {
            Get.offAllNamed('/kafi');
          } else if (maintenanceMode) {
            Get.offAllNamed('/maintenance');
          } else {
            Get.offAllNamed('/home');
          }
        }
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
