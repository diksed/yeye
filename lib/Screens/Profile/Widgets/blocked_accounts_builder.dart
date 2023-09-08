import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Constants/app_texts.dart';
import 'package:yeye/Screens/Comments/Widgets/Comments/comment_email_fixer.dart';

StreamBuilder blockedAccountBuilder(Stream<dynamic>? stream,
    RxList<String> blockedAccounts, Function unblockAccount) {
  return StreamBuilder(
    stream: stream,
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Image.asset(AppTexts.loadingImage);
      } else {
        if (blockedAccounts.isEmpty) {
          return const Center(child: Text(AccountActions.noBlockedAccount));
        } else {
          return ListView.builder(
            itemCount: blockedAccounts.length,
            itemBuilder: (context, index) {
              return ListTile(
                iconColor: Colors.green,
                title: Text(shortenEmail(blockedAccounts[index])),
                trailing: IconButton(
                    onPressed: () async {
                      unblockAccount(index);
                    },
                    icon: const Icon(Icons.lock_open_outlined)),
              );
            },
          );
        }
      }
    },
  );
}
