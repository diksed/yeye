import 'package:flutter/material.dart';

class LogoSizedBox extends StatelessWidget {
  const LogoSizedBox({
    Key? key,
    required this.appHeight,
    required this.appWidth,
  }) : super(key: key);

  final double appHeight;
  final double appWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appHeight * 0.35,
      width: appWidth * 0.8,
      child: Image.asset(
        'assets/images/logo.png',
        scale: 0.8,
      ),
    );
  }
}