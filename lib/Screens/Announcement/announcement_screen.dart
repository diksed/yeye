import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Common/logo_box.dart';
import 'package:yeye/Common/text_styles.dart';
import 'package:yeye/Constants/app_colors.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Announcement/Widgets/default_announcement.dart';
import '../../Models/announcement_model.dart';
import 'Widgets/Builder/announcement_builder.dart';
import 'announcement_controller.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  final AnnouncementController controller = Get.put(AnnouncementController());

  @override
  void initState() {
    super.initState();
    controller.fetchAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          LogoSizedBox(height: Get.height / 3, width: Get.width / 3),
          Text(TitleMessages.announcements, style: titleTextStyle()),
          SizedBox(height: Get.height / 19.51),
          StreamBuilder<List<AnnouncementModel>>(
            stream: controller.announcementListStream.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.announcement = snapshot.data!;
                if (controller.announcement.isNotEmpty) {
                  return SizedBox(
                    height: Get.height / 1.5,
                    width: Get.width,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: controller.announcement
                          .map(buildAnnouncement)
                          .toList(),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      DefaultAnnouncement(
                          gestureActive: false,
                          textFirst: ContactInfoText.yeYe,
                          textSecond: '',
                          textThird: ContactInfoText.purpose,
                          height: Get.height / 4.26,
                          firstLogoText: AppTexts.logoImage,
                          firstLogoVisible: true,
                          secondLogoVisible: false),
                      SizedBox(height: Get.height / 19.51),
                      DefaultAnnouncement(
                          gestureActive: true,
                          textFirst: ContactInfoText.contactUs,
                          textSecond: ContactInfoText.contactYeYeInstagram,
                          textThird: ContactInfoText.contactYeYeMail,
                          color: AppColors.themeRedColor,
                          height: Get.height / 3.41,
                          firstLogoText: AppTexts.instagramLogo,
                          firstLogoVisible: true,
                          secondLogoVisible: true),
                    ],
                  );
                }
              } else {
                return Center(child: Image.asset(AppTexts.loadingImage));
              }
            },
          )
        ],
      ),
    )));
  }
}
