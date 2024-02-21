import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'Widgets/bottom_nav_bar_item.dart';
import 'bottom_nav_bar_controller.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          BottomAppBar(
            color: AppColors.splashColor,
            height: Get.height / 10.218,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    bottomAppBarItem(
                      icon: Icons.home,
                      page: 0,
                      context,
                      label: BottomNavBarMessages.home,
                      bottomNavBarController: bottomNavBarController,
                    ),
                    bottomAppBarItem(
                      icon: Icons.comment_rounded,
                      page: 1,
                      context,
                      label: BottomNavBarMessages.comments,
                      bottomNavBarController: bottomNavBarController,
                    ),
                    bottomAppBarItem(
                      icon: Icons.announcement_rounded,
                      page: 2,
                      context,
                      label: BottomNavBarMessages.announcements,
                      bottomNavBarController: bottomNavBarController,
                    ),
                    bottomAppBarItem(
                      icon: Icons.person,
                      page: 3,
                      context,
                      label: BottomNavBarMessages.profile,
                      bottomNavBarController: bottomNavBarController,
                    ),
                    bottomAppBarItem(
                      icon: Icons.credit_card,
                      page: 4,
                      context,
                      label: BottomNavBarMessages.loadMoney,
                      bottomNavBarController: bottomNavBarController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: bottomNavBarController.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: bottomNavBarController.animateToTab,
        children: [...bottomNavBarController.pages],
      ),
    );
  }
}
