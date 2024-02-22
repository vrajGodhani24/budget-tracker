import 'package:expence_tracker/module/views/homepage/screens/homepage.dart';
import 'package:expence_tracker/module/views/splash/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/splash', page: () => const SplashScreen()),
      ],
    ),
  );
}
