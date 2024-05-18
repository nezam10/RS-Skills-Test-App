import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rs_skill_test_app/app/modules/signup/controllers/signup_controller.dart';

import '../../../core/helpers/app_helper.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_space.dart';
import '../../../global_widgets/custom_text_field.dart';

class VerifySignupView extends GetView<SignupController> {
  const VerifySignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.appcolor,
          elevation: 0,
          centerTitle: true,
          title: const Text("Verify"),
        ),
        body: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: Center(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => CustomTextformField(
                        height: controller.textFieldLength.isTrue ? 60 : 85,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        controller: controller.otpTexController,
                        obscureText: controller.isVisiblePassword1.value,
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        suffixIcon:
                            controller.textLengthOldPass.value.isNotEmpty
                                ? Helpers.passwordVisivilityMethod(() {
                                    controller.isVisiblePassword1.value =
                                        !controller.isVisiblePassword1.value;
                                  }, controller.isVisiblePassword1.value)
                                : null,
                        hintText: "Enter OTP",
                        onChanged: (onChangeValue) {
                          controller.textLengthOldPass.value = onChangeValue;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            controller.textFieldLength.value = false;
                            return 'Enter OTP';
                          } else if (value.length < 6) {
                            return 'OTP Must be 6 Characters';
                          }
                          return null;
                        },
                      )),
                  AppSpace.spaceH20,
                  InkWell(
                    onTap: () async {
                      if (controller.formKey.currentState!.validate()) {
                        print("Click");
                        await controller.verifyRegisterCon();
                      } else {
                        print("error");
                      }
                    },
                    child: Obx(
                      () => Container(
                        height: 50,
                        width: Get.width,
                        alignment: Alignment.center,
                        decoration: Helpers.customCircularDecoretion(
                            context, AppColors.appcolor, 5),
                        child: controller.isLoadingVerifyRegister.value == true
                            ? const Text(
                                'Verify',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )
                            : const Center(
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  AppSpace.spaceH30,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
