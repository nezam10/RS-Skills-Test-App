import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/app_helper.dart';
import '../../../../core/values/app_assets.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_space.dart';
import '../../controllers/home_controller.dart';

class TabBarMaterialWidget extends StatelessWidget {
  final int selectIndex;
  final ValueChanged<int> onChangedTab;
  const TabBarMaterialWidget({
    super.key,
    required this.selectIndex,
    required this.onChangedTab,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    print(Get.width);
    homeController.screenWidth = Get.width;

    return Container(
      height: 65,
      width: Get.width,
        decoration: Helpers.customCircularDecoretion(
          context,
          AppColors.appcolor,
          12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(
                homeController: homeController,
                index: 0,
                assetName: AppAssets.homeIcon,
                name: "Home"),
            buildTabItem(
                homeController: homeController,
                index: 1,
                assetName: AppAssets.exerciseIcon,
                name: "2"),
            buildTabItem(
                homeController: homeController,
                index: 2,
                assetName: AppAssets.journalIcon,
                name: "3"),
            buildTabItem(
                homeController: homeController,
                index: 3,
                assetName: AppAssets.careIcon,
                name: "Branch"),
          ],
        ),
      );
  }

  Widget buildTabItem({
    required HomeController homeController,
    required int index,
    required String assetName,
    required String name,
  }) {
    final isSelected = index == selectIndex;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? AppColors.white : Colors.grey,
      ),
      child: MaterialButton(
        minWidth: 40,
        //icon: icon,

        onPressed: () => onChangedTab(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(assetName),
              color: isSelected ? AppColors.white : Colors.grey,
              size: Get.width < 360 ? 25 : 30,
            ),
            AppSpace.spaceH4,
            Text(
              name,
              style: TextStyle(
                color: isSelected ? AppColors.white : Colors.grey,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                fontSize: homeController.bottomNavFontSize(Get.width),
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
