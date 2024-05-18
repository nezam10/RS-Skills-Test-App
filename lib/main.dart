import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/controllers/app_binding.dart';
import 'app/routes/app_pages.dart';

late SharedPreferences preferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  preferences.getString('appToken');
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      initialBinding: AppBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      popGesture: true,
    ),
  );
}
