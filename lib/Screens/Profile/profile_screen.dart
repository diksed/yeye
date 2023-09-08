import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Common/box_decorations.dart';
import 'package:yeye/Common/logo_box.dart';
import 'package:yeye/Common/text_styles.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Account/Widgets/Buttons/login_register_button.dart';
import 'package:yeye/Screens/Comments/Widgets/MakeComment/line_in_comment_card.dart';
import 'package:yeye/Screens/Profile/Widgets/profile_info_builder.dart';
import 'package:yeye/Screens/Profile/profile_controller.dart';

import '../../Widgets/AlertDialog/alert_dialogs.dart';
import 'Widgets/blocked_accounts_builder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    controller.fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          LogoSizedBox(height: Get.height / 3, width: Get.height / 3),
          Text(TitleMessages.accountInfo, style: titleTextStyle()),
          SizedBox(height: Get.height / 20),
          LineInCommentCard(color: Colors.grey, width: Get.width),
          profileInfoStreamBuilder(controller.profileData.stream,
              Icons.mail_outline_outlined, 'email'),
          LineInCommentCard(color: Colors.grey, width: Get.width),
          profileInfoStreamBuilder(
              controller.profileData.stream, Icons.school, 'university'),
          LineInCommentCard(color: Colors.grey, width: Get.width),
          profileInfoStreamBuilder(
              controller.profileData.stream, Icons.location_city, 'campus'),
          LineInCommentCard(color: Colors.grey, width: Get.width),
          SizedBox(height: Get.height / 33.6),
          Text(TitleMessages.blockedAccounts, style: titleTextStyle()),
          SizedBox(height: Get.height / 67.2),
          Container(
              decoration: customBoxDecoration(
                  10, AppColors.cardColor, Colors.black, 0.1),
              height: Get.height / 4.2,
              width: Get.width / 1.08,
              child: blockedAccountBuilder(controller.profileData.stream,
                  controller.blockedAccounts, controller.unblockAccount)),
          SizedBox(height: Get.height / 22.4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginRegisterButton(
                  onPressed: () {
                    deleteAccountAlertDialog();
                  },
                  height: Get.height / 19,
                  width: Get.width / 3.2,
                  child: const Text(AccountActions.deleteAccount)),
              LoginRegisterButton(
                  onPressed: () {
                    logoutAlertDialog();
                  },
                  height: Get.height / 19,
                  width: Get.width / 3.2,
                  child: const Text(AccountActions.logout)),
            ],
          )
        ],
      ),
    ));
  }
}
