import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rs_skill_test_app/app/data/services/api_service.dart';

import '../../../../main.dart';
import '../../../controllers/app_controller.dart';
import '../../../core/helpers/app_helper.dart';
import '../../../core/helpers/app_keys.dart';
import '../../../routes/app_pages.dart';
import '../views/verify_signup_view.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //final appController = Get.find<AppController>();
  final appController = Get.put<AppController>(AppController());
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneumberController = TextEditingController();
  final businessNameController = TextEditingController();
  final businessTypeIdController = TextEditingController();
  final otpTexController = TextEditingController();

  final count = 0.obs;
  final isVisiblePassword1 = true.obs;
  var textLengthOldPass = "".obs;
  var isLoadingVerifyRegister = true.obs;
  var isLoadingRegister = true.obs;
  final textFieldLength = true.obs;
  final texfH1 = false.obs;
  final texfH2 = false.obs;
  final texfH3 = false.obs;
  final texfH4 = false.obs;
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

  //*****************Registration Controller*****************
  Future submittedRegisterCon() async {
    isLoadingRegister(false);
    Map<String, dynamic> changePassMapBody = {
      "phone": phoneumberController.text,
      "email": emailController.text,
      "name": fullNameController.text,
      "business_name": businessNameController.text,
      "business_type_id": '7'
    };

    if (await appController.checkInternetConnection()) {
      try {
        var resValue = await ApiService()
            .registerProvider(registerMapBody: changePassMapBody);
        var bodyMap = json.decode(resValue.body);
        print('bodyMap== ${bodyMap}');
        if (bodyMap['msg'] == 'OK') {
          await preferences.setString(
              AppKeys.userId, bodyMap['identifier_id'].toString());
          phoneumberController.clear();
          emailController.clear();
          fullNameController.clear();
          businessNameController.clear();
          Get.to(() => const VerifySignupView());
          Helpers.snackbarForSucess(
              titleText: 'Success'.tr, bodyText: "${bodyMap["description"]}");
          isLoadingRegister(true);
        } else {
          Helpers.snackbarForErorr(
              titleText: 'Alert'.tr, bodyText: "${bodyMap["description"]}");
          isLoadingRegister(true);
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
      isLoadingRegister(true);
    }
  }

  //*****************Registration Verify Controller*****************
  Future verifyRegisterCon() async {
    isLoadingVerifyRegister(false);
    Map<String, dynamic> changePassMapBody = {
      "identifier_id": preferences.getString(AppKeys.userId).toString(),
      "otp_code": otpTexController.text,
    };

    if (await appController.checkInternetConnection()) {
      try {
        var resValue = await ApiService()
            .verifyRegisterProvider(verifyMapBody: changePassMapBody);
        var bodyMap = json.decode(resValue.body);
        print('bodyMap ${bodyMap}');
        if (bodyMap['msg'] == 'OK') {
          otpTexController.clear();
          Get.offAllNamed(Routes.LOGIN);
          Helpers.snackbarForSucess(
              titleText: 'Success'.tr, bodyText: "${bodyMap["description"]}");
          isLoadingVerifyRegister(true);
        } else {
          Helpers.snackbarForErorr(
              titleText: 'Alert'.tr, bodyText: "${bodyMap["description"]}");
          isLoadingVerifyRegister(true);
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
      isLoadingVerifyRegister(true);
    }
  }
}
