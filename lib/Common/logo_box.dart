import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoSizedBox extends StatelessWidget {
  const LogoSizedBox({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = height ?? Get.height;
    final effectiveWidth = width ?? Get.width;

    return SizedBox(
      height: effectiveHeight * 0.35,
      width: effectiveWidth * 0.8,
      child: Image.asset(
        'assets/images/logo.png',
        scale: 0.8,
      ),
    );
  }
}
