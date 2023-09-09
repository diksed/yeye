import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Constants/app_texts.dart';

void agreementLauncher(String urlPath) async {
  Uri url = Uri.parse(urlPath);
  var urllaunchable = await canLaunchUrl(url);
  if (urllaunchable) {
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> showUserAgreementDialog(RxBool acceptedTerms, String email,
    String password, VoidCallback onRegisterPressed) async {
  await Get.dialog(
    AlertDialog(
      title: const Text(AccountActions.register),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(AccountActions.makeSureAboutRegister),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Checkbox(
                  value: acceptedTerms.value,
                  onChanged: (value) {
                    acceptedTerms.value = value!;
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: const Text(
                      AccountActions.userAgreement,
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      agreementLauncher(LoadMoneyMessages.agreementUrl);
                    },
                  ),
                  const Text(AccountActions.accept),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text(LoadMoneyMessages.goBack),
        ),
        Obx(
          () => TextButton(
            onPressed: acceptedTerms.value ? onRegisterPressed : null,
            child: const Text(AccountActions.register),
          ),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
