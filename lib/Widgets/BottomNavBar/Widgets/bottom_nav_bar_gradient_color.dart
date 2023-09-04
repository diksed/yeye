import 'package:flutter/material.dart';
import 'package:yeye/Common/display_size.dart';

import '../../../Constants/app_colors.dart';

class BottomNavBarGradientContainer extends StatelessWidget {
  const BottomNavBarGradientContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.themeColor),
      height: displayHeight(context)/12.218,
    );
  }
}
