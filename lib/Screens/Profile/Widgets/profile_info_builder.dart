import 'package:flutter/material.dart';
import 'package:yeye/Constants/app_texts.dart';

import 'profile_info_row.dart';

StreamBuilder<dynamic> profileInfoStreamBuilder(
    Stream<dynamic>? stream, IconData icon, String info) {
  return StreamBuilder<dynamic>(
    stream: stream,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return profileInfoRow(snapshot.data[info], icon);
      } else if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
            child: SizedBox(
                height: 30, child: Center(child: CircularProgressIndicator())));
      } else {
        return const Text(WarningMessages.noInformation);
      }
    },
  );
}
