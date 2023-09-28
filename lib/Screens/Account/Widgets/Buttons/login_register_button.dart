import 'package:flutter/material.dart';
import 'package:yeye/Constants/app_colors.dart';

class LoginRegisterButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? textFontSize;
  final double width;
  final double height;
  final bool isActive;

  const LoginRegisterButton({
    Key? key,
    required this.onPressed,
    this.textFontSize,
    required this.text,
    required this.height,
    required this.width,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : () {},
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          shadowColor: Colors.transparent,
          backgroundColor: isActive ? AppColors.rawSnackbarColor : const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: AppColors.rawSnackbarColor)),
        ),
        child: Text(text,
            style: TextStyle(
                color: isActive ? Colors.white : AppColors.rawSnackbarColor,
                fontSize: textFontSize)),
      ),
    );
  }
}
