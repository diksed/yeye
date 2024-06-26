import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Announcement/announcement_screen.dart';
import 'package:yeye/Screens/Comments/comments_screen.dart';
import 'package:yeye/Screens/Menu/menu_screen.dart';
import 'package:yeye/Screens/Profile/profile_screen.dart';
import 'package:yeye/Widgets/AlertDialog/alert_dialogs.dart';

class BottomNavBarController extends GetxController {
  late PageController pageController;

  RxInt currentPage = 0.obs;

  final List<Widget> pages = [
    const MenuScreen(),
    const CommentsScreen(),
    const AnnouncementScreen(),
    const ProfileScreen()
  ];

  void goToTab(int page) {
    if (page == 4) {
      loadMoneyAlertDialog(
          LoadMoneyMessages.loadMoneyToCard,
          LoadMoneyMessages.areYouSure,
          LoadMoneyMessages.loadMoney,
          LoadMoneyMessages.websiteUrl);
    } else {
      currentPage.value = page;
      pageController.jumpToPage(page);
    }
  }

  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
