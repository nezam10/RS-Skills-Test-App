import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rs_skill_test_app/app/data/models/user_info_model.dart';
import 'package:rs_skill_test_app/app/routes/app_pages.dart';

import '../../../../main.dart';
import '../../../controllers/app_controller.dart';
import '../../../core/helpers/app_helper.dart';
import '../../../data/services/api_service.dart';

class LoginController extends GetxController {
  final appController = Get.put<AppController>(AppController());
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final count = 0.obs;
  final otpVisibility = false.obs;
  var isLoadingLogin = true.obs;
  var isLoadingLoginVerify = true.obs;

  
  final _user = UserInfoModel().obs;
  UserInfoModel get user => _user.value;
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

  void increment() => count.value++;

  /*----------------------- Login Otp Controller -----------------------*/
  Future loginOtpController() async {
    isLoadingLoginVerify(false);
    Map<String, dynamic> changePassMapBody = {
      "identifier": emailController.text,
    };

    if (await appController.checkInternetConnection()) {
      try {
        var resValue = await ApiService()
            .sendLoginOtpProvider(loginOtpMapBody: changePassMapBody);
        var bodyMap = json.decode(resValue.body);
        print('bodyMap ${bodyMap}');
        if (bodyMap['msg'] == 'OK') {
          otpVisibility.value = true;
          Helpers.snackbarForSucess(
              titleText: 'Success'.tr, bodyText: "${bodyMap["message"]}");
          isLoadingLoginVerify(true);
        } else {
          Helpers.snackbarForErorr(
              titleText: 'Alert'.tr, bodyText: "${bodyMap["description"]}");
          isLoadingLoginVerify(true);
        }
      } catch (e) {
        if (kDebugMode) {
          print('SignUpController.registerController error :$e');
        }
      }
    } else {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(
          content: Text("Please check your internet connection"),
        ),
      );
      isLoadingLoginVerify(true);
    }
  }

  /*----------------------- Login Controller -----------------------*/
  Future<UserInfoModel?> loginController() async {
    isLoadingLogin(false);
    Map<String, dynamic> changePassMapBody = {
      "otp_code": otpController.text,
      "identifier": emailController.text,
    };

    if (await appController.checkInternetConnection()) {
      try {
        var resValue =
            await ApiService().loginProvider(loginMapBody: changePassMapBody);
        var bodyMap = json.decode(resValue.body);
        print('bodyMap ${bodyMap}');
        if (bodyMap['msg'] == 'OK') {
          print("api_token== : ${bodyMap['user']['api_token'].toString()}");
          // await preferences.setString(
          //   AppKeys.userId, bodyMap['identifier_id'].toString());
          emailController.clear();
          otpController.clear();
          //Get.offAllNamed(Routes.LOGIN);
          UserInfoModel userInfo = UserInfoModel.fromJson(bodyMap['user']);
          print("user info---------------${userInfo.email}");
          await preferences.setString('appToken', bodyMap['user']['api_token'].toString());
          Helpers.snackbarForSucess(
              titleText: 'Success', bodyText: "${bodyMap["description"]}");
          isLoadingLogin(true);
          if (preferences.getString('appToken') != null) {
            Get.offAllNamed(Routes.HOME);
            return userInfo;
          } else {
            return null;
          }
        } else {
          otpController.clear();
          Helpers.snackbarForErorr(
              titleText: 'Alert', bodyText: "${bodyMap["description"]}");
          isLoadingLogin(true);
        }
      } catch (e) {
        if (kDebugMode) {
          print('loginController error :$e');
        }
      }
    } else {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(
          content: Text("Please check your internet connection"),
        ),
      );
      isLoadingLogin(true);
    }
    return null;
  }
}
