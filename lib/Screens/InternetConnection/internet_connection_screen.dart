import 'package:flutter/material.dart';

class InternetConnectionScreen extends StatelessWidget {
  const InternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Internet Bağlantısı Yok Ekranı'),
      ),
    );
  }
}
