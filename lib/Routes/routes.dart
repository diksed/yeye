import 'package:get/get.dart';
import 'package:yeye/Screens/Account/Login/login_screen.dart';
import 'package:yeye/Screens/Account/VerifyEmail/verify_email_screen.dart';
import 'package:yeye/Screens/Home/home_screen.dart';
import 'package:yeye/Screens/Menu/menu_screen.dart';

import '../Screens/Account/Auth/auth_screen.dart';
import '../Screens/Account/ForgotPassword/forgot_password_screen.dart';
import '../Screens/Splash/splash_screen.dart';

appRoutes() => [
      GetPage(name: '/splash', page: () => const SplashScreen()),
      GetPage(name: '/home', page: () => HomeScreen()),
      GetPage(name: '/login', page: () => LoginScreen()),
      GetPage(name: '/menu', page: () => const MenuScreen(), transition: Transition.downToUp),
      GetPage(name: '/auth', page: () => AuthScreen(), transition: Transition.downToUp),
      GetPage(name: '/verify-email', page: () => const VerifyEmailScreen()),
      GetPage(
          name: '/forgot-password',
          page: () => const ForgotPasswordScreen(),
          transition: Transition.rightToLeftWithFade)
    ];
