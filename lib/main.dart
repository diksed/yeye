import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeye/Routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Service/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: appRoutes(),
    );
  }
}
