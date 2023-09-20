import 'package:get/get.dart';
import 'package:yeye/Screens/Account/Delete/delete_account_screen.dart';
import 'package:yeye/Screens/Account/Login/login_screen.dart';
import 'package:yeye/Screens/Account/Suspended/suspended_screen.dart';
import 'package:yeye/Screens/Account/VerifyEmail/verify_email_screen.dart';
import 'package:yeye/Screens/Home/home_screen.dart';
import 'package:yeye/Screens/InternetConnection/internet_connection_screen.dart';
import 'package:yeye/Screens/InternetConnection/splash_internet_connection_screen.dart';
import 'package:yeye/Screens/Maintenance/maintenance_screen.dart';
import 'package:yeye/Screens/Menu/menu_screen.dart';
import 'package:yeye/Widgets/BottomNavBar/bottom_nav_bar.dart';

import '../Screens/Account/Auth/auth_screen.dart';
import '../Screens/Account/ForgotPassword/forgot_password_screen.dart';
import '../Screens/Splash/splash_screen.dart';

appRoutes() => [
      GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
          transition: Transition.fadeIn),
      GetPage(
          name: '/home',
          page: () => HomeScreen(),
          transition: Transition.fadeIn),
      GetPage(
          name: '/login',
          page: () => LoginScreen(),
          transition: Transition.rightToLeftWithFade),
      GetPage(
          name: '/menu',
          page: () => const MenuScreen(),
          transition: Transition.fadeIn),
      GetPage(
          name: '/auth',
          page: () => AuthScreen(),
          transition: Transition.fadeIn),
      GetPage(
          name: '/verify-email',
          page: () => const VerifyEmailScreen(),
          transition: Transition.fadeIn),
      GetPage(
          name: '/forgot-password',
          page: () => const ForgotPasswordScreen(),
          transition: Transition.rightToLeftWithFade),
      GetPage(name: '/bottom-nav-bar', page: () => BottomNavBar()),
      GetPage(
          name: '/maintenance',
          page: () => const MaintenanceScreen(),
          transition: Transition.fadeIn),
      GetPage(
          name: '/internet-connection',
          page: () => const InternetConnectionScreen(),
          transition: Transition.fadeIn),
      GetPage(
          name: '/splash-internet-connection',
          page: () => const SplashInternetConnectionScreen(),
          transition: Transition.fadeIn),
      GetPage(
          name: '/suspended',
          page: () => const SuspendedScreen(),
          transition: Transition.fadeIn),
      GetPage(
          name: '/delete-account',
          page: () => const DeleteAccountScreen(),
          transition: Transition.downToUp)
    ];
