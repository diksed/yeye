import 'package:flutter/material.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Comments/Widgets/Report/report_dialog.dart';

import '../../../../Constants/app_colors.dart';

class ReportAndBlockButton extends StatelessWidget {
  const ReportAndBlockButton({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 1) {
          reportShowDialog(context, email, 1);
        } else if (value == 2) {
          reportShowDialog(context, email, 2);
        }
      },
      tooltip: WarningMessages.showMenu,
      color: AppColors.whiteShade,
      padding: const EdgeInsets.only(top: 0),
      icon: const Icon(Icons.no_accounts, color: AppColors.themeBlueColor),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Text(
            WarningMessages.report,
            style: TextStyle(color: Colors.black),
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text(
            WarningMessages.blockAndReport,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
