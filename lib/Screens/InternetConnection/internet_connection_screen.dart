import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Service/internet_connection.dart';

class InternetConnectionScreen extends StatelessWidget {
  InternetConnectionScreen({super.key});

  final InternetConnectionService _internetConnectionService =
      Get.put(InternetConnectionService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: StreamBuilder(
          stream: _internetConnectionService.onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final result = snapshot.data;
              switch (result) {
                case ConnectivityResult.wifi:
                case ConnectivityResult.mobile:
                  Future.delayed(Duration.zero, () {
                    Get.offAllNamed('/home');
                  });
                  return const Text('');
                case ConnectivityResult.none:
                  return const Text('Not Connected');
                default:
                  return const Text('Not Connected');
              }
            } else {
              return const Text('Internet Bağlantısı Yok Ekranı');
            }
          },
        ),
      ),
    );
  }
}
