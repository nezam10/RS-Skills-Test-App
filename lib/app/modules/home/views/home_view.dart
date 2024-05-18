import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import '../../../global_widgets/custom_drawer.dart';
import '../controllers/home_controller.dart';
import 'local_widget/tabbar_material.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) return;
        openDialog();
      },
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          key: controller.globalKey,
          drawer: const Drawer(
              backgroundColor: Colors.white,
              child: CustomDrawer(),
            ),
          body: GetBuilder<HomeController>(
            builder: (_) {
              return Center(
                child: _.navigationScreen.elementAt(_.selectedIndex),
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: GetBuilder<HomeController>(
            builder: (controller2) {
              return Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TabBarMaterialWidget(
                      selectIndex: controller2.selectedIndex,
                      onChangedTab: (value) async {
                        controller2.onItemTapped(value);
                        print("value == $value");
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /* ::::::::::::::::::::::: OnWillPop show dialog :::::::::::::::::::::::*/
  openDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Are Yor Sure?'),
        content: const Text('Do you want to exit this App'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
                print("android>>>>");
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }
}
