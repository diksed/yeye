import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Service/network_connection.dart';

import 'internet_connection_screen.dart';

class SplashInternetConnectionScreen extends StatelessWidget {
  const SplashInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: StreamBuilder(
          stream: NetworkController().connectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final result = snapshot.data;
              switch (result) {
                case ConnectivityResult.wifi:
                case ConnectivityResult.mobile:
                  Future.delayed(Duration.zero, () {
                    Get.offAllNamed('/splash');
                  });
                  return const Text('');
                case ConnectivityResult.none:
                  return const Text('Not Connected');
                default:
                  return const Text('Not Connected');
              }
            } else {
              return const InternetConnectionScreen();
            }
          },
        ),
      ),
    );
  }
}
