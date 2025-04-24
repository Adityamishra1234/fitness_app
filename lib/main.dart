import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/splash/views/splash_view.dart';
import 'app/routes/app_pages.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // Auto-switch
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: SplashView(),
    );
  }
}
