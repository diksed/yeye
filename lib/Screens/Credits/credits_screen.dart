import 'package:credits/credits.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_colors.dart';

class CreditsScreen extends StatefulWidget {
  const CreditsScreen({super.key});

  @override
  State<CreditsScreen> createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeBlueColor,
      body: Credits(
        backgroundColor: AppColors.splashColor,
        onFinished: () {
          Get.back();
        },
        crossAxisAlignment: CrossAxisAlignment.center,
        delay: const Duration(milliseconds: 500),
        duration: const Duration(milliseconds: 20000),
        children: [
          creditText("YeYe'ye katkıda bulunan:",
              size: 30, color: AppColors.warningIconColor),
          creditText('Eren Karaboğa,'),
          creditText('İbrahim Çiçek,'),
          creditText('Ahmet Ceylan,'),
          creditText('Emirhan Ulaş,'),
          creditText('Abdullah Eren Kanık,'),
          creditText('Enes Susan,'),
          creditText('Dilara Özdemir,'),
          creditText('Ömer Faruk Kasapoğlu,'),
          creditText('Semih Eseroğlu'),
          RichText(
            text: const TextSpan(
              text: 've tüm ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 26),
              children: [
                TextSpan(
                  text: 'YeYe ',
                  style: TextStyle(color: AppColors.warningIconColor),
                ),
                TextSpan(
                    text: 'kullanıcılarına',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ))
              ],
            ),
          ),
          const Text(
            'teşekkür ederiz!',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 26),
          ),
        ],
      ),
    );
  }
}

Widget creditText(String text,
        {Color? color = Colors.white, double size = 26}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
