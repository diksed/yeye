import 'package:get/get.dart';
import 'package:yeye/Screens/Account/Login/login_screen.dart';
import 'package:yeye/Screens/Account/VerifyEmail/verify_email_screen.dart';
import 'package:yeye/Screens/Home/home_screen.dart';
import 'package:yeye/Screens/Maintenance/maintenance_screen.dart';
import 'package:yeye/Screens/Menu/menu_screen.dart';
import 'package:yeye/Widgets/BottomNavBar/bottom_nav_bar.dart';

import '../Screens/Account/Auth/auth_screen.dart';
import '../Screens/Account/ForgotPassword/forgot_password_screen.dart';
import '../Screens/Splash/splash_screen.dart';

appRoutes() => [
      GetPage(name: '/splash', page: () => const SplashScreen()),
      GetPage(name: '/home', page: () => HomeScreen()),
      GetPage(name: '/login', page: () => LoginScreen()),
      GetPage(
        name: '/menu',
        page: () => const MenuScreen(),
      ),
      GetPage(
        name: '/auth',
        page: () => AuthScreen(),
      ),
      GetPage(name: '/verify-email', page: () => const VerifyEmailScreen()),
      GetPage(
          name: '/forgot-password',
          page: () => const ForgotPasswordScreen(),
          transition: Transition.rightToLeftWithFade),
      GetPage(name: '/bottom-nav-bar', page: () => BottomNavBar()),
      GetPage(name: '/maintenance', page: () => const MaintenanceScreen()),
    ];
