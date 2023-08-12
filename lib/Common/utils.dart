import 'package:flutter/material.dart';

class Utils {
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String? text) {
    if (text == null) return;
    final snackBar =
        SnackBar(content: Text(text), backgroundColor: Colors.red);

    ScaffoldMessenger.of(messengerKey.currentContext!)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
