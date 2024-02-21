import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';

Widget contributorsDialog() {
  return AlertDialog(
    backgroundColor: Colors.white,
    content: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'YeYe\'ye katkıda bulunan:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text('Eren Karaboğa,'),
          const Text('İbrahim Çiçek,'),
          const Text('Ahmet Ceylan,'),
          const Text('Emirhan Ulaş,'),
          const Text('Abdullah Eren Kanık,'),
          const Text('Enes Susan,'),
          const Text('Dilara Özdemir,'),
          const Text('Ömer Faruk Kasapoğlu,'),
          const Text('Semih Eseroğlu,'),
          RichText(
            text: const TextSpan(
              text: 've tüm ',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'YeYe ',
                  style: TextStyle(color: AppColors.themeRedColor),
                ),
                TextSpan(text: 'kullanıcılarına')
              ],
            ),
          ),
          const Text(
            'Teşekkür Ederiz!',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    shadowColor: Colors.black,
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
        ),
        child: const Text(AccountActions.close),
      ),
    ],
  );
}
