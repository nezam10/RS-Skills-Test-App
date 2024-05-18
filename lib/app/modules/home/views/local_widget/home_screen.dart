import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rs_skill_test_app/app/modules/home/controllers/home_controller.dart';

import '../../../../../main.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_space.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appcolor,
          leading: IconButton(
            onPressed: () {
              controller.globalKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
          centerTitle: true,
          title: const Text("Test App", style: TextStyle(color: Colors.white),),
        ),
        body: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              _welcomeWidget(context),
            ],
          ),
        ),
        const SizedBox(height: 70)
      ],
    );
  }

  _welcomeWidget(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppSpace.spaceH30,
          InkWell(
            onTap: () {
              print(preferences.getString('appToken'));
            },
            child: Text(
                  "Welcome!",
                  style: AppTextStyleLight.labelLarge.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff483177)),
                ),
          ),
        ],
      ),
    );
  }

}
