import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Common/utils.dart';
import '../../../../Constants/app_texts.dart';

void agreementLauncher() async {
  Uri url = Uri.parse(LoadMoneyMessages.agreementUrl);
  var urllaunchable = await canLaunchUrl(url);
  if (urllaunchable) {
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> showUserAgreementDialog(
    RxBool acceptedTerms, String email, String password) async {
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
                      agreementLauncher();
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
            onPressed: acceptedTerms.value
                ? () async {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      Get.offAllNamed('/menu');
                    } catch (e) {
                      Utils.showSnackBar(WarningMessages.registrationFailed);
                    }
                  }
                : null,
            child: const Text(AccountActions.register),
          ),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
