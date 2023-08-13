import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Home/home_controller.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            HomeController().signOut();
            Get.offAllNamed('/auth');
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
