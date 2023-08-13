import 'package:flutter/material.dart';

class LoginRegisterButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double width;
  final double height;
  final bool isActive;
  final Color inactiveColor;

  const LoginRegisterButton({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.height,
    required this.width,
    this.isActive = true,
    this.inactiveColor =  const Color.fromARGB(255, 138, 138, 138),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColor = isActive
        ? const LinearGradient(colors: [
            Color.fromARGB(255, 48, 97, 212),
            Color.fromARGB(255, 148, 191, 235),
          ])
        : LinearGradient(colors: [inactiveColor, Colors.grey[300]!],begin: Alignment.topLeft,end: Alignment.bottomRight);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: child,
      ),
    );
  }
}
