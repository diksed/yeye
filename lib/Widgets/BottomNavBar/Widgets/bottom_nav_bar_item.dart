import 'package:flutter/material.dart';


Widget bottomAppBarItem(BuildContext context,
    {required icon,
    required page,
    required label,
    required bottomNavBarController}) {
  return GestureDetector(
    onTap: () => bottomNavBarController.goToTab(page),
    child: Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: bottomNavBarController.currentPage == page
                ? Colors.black
                : Colors.white,
            size: 20,
          ),
          Text(
            label,
            style: TextStyle(
                color: bottomNavBarController.currentPage == page
                    ? Colors.black
                    : Colors.white,
                fontSize: 13,
                fontWeight: bottomNavBarController.currentPage == page
                    ? FontWeight.w600
                    : null),
          ),
        ],
      ),
    ),
  );
}
