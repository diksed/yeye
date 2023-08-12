
import 'package:get/get.dart';
import 'package:yeye/Screens/Home/home_screen.dart';

import '../Screens/Splash/splash_screen.dart';

appRoutes() => [
  GetPage(name: '/splash', page: () => const SplashScreen()),
  GetPage(name: '/home', page: () => const HomeScreen()),
];