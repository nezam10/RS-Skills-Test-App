import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rs_skill_test_app/app/data/models/user_info_model.dart';

import '../../../../main.dart';
import '../../../controllers/app_controller.dart';
import '../../../core/helpers/app_helper.dart';
import '../../../data/services/api_service.dart';
import '../../../routes/app_pages.dart';
import '../views/local_widget/home_screen.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  final appController = Get.isRegistered<AppController>()
        ? Get.find<AppController>()
        : Get.put(AppController());
        
  final count = 0.obs;
  int selectedIndex = 0;
  var screenWidth = Get.width;
UserInfoModel userInfoModel = UserInfoModel();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateState() => update();

  // systemNavigationBarTheme
  void statusBarTheme() {
    Get.isDarkMode
        ? SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Colors.black,
            ),
          )
        : SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Colors.black,
            ),
          );
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> navigationScreen = <Widget>[
    HomeScreen(),
    const Text('Index 1: 11', style: optionStyle),
    const Text('Index 2: 22', style: optionStyle),
    const Text('Index 3: 33', style: optionStyle),
    const Text('Index 4: 44', style: optionStyle),
  ];

  // Method
  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

  void incrementTab(index) {
    print('floating button');
    print(index);
  }

  double bottomNavFontSize(double screenWidth) {
    if (screenWidth > 400) {
      return 14.0;
    } else if (screenWidth > 370) {
      return 12.0;
    } else if (screenWidth > 350) {
      return 11.0;
    } else {
      return 10.0;
    }
  }

  /*----------------------- Login Controller -----------------------*/
  Future logoutController() async {
    if (await appController.checkInternetConnection()) {
      try {
        var resValue =
            await ApiService().logOutProvider();
        var bodyMap = json.decode(resValue.body);
        print('bodyMap ${bodyMap}');
        if (bodyMap['msg'] == 'OK') {
          await preferences.remove('appToken');
          Get.offAllNamed(Routes.LOGIN);
          Helpers.snackbarForSucess(
              titleText: 'Success'.tr, bodyText: "${bodyMap["description"]}");
          
        } else {
          await preferences.remove('appToken');
          Get.offAllNamed(Routes.LOGIN);
          Helpers.snackbarForErorr(
              titleText: 'Alert'.tr, bodyText: "${bodyMap["description"]}");
        }
      } catch (e) {
        if (kDebugMode) {
          print('logoutController error :$e');
        }
      }
    } else {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(
          content: Text("Please check your internet connection"),
        ),
      );
    }
    return null;
  }
}
