import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/helpers/app_helper.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_space.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {FocusScope.of(context).unfocus();},
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.white,
          body: _buildBody(),
        ),
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Obx(
        () => Form(
          key: controller.registrationFormKey,
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              simpleAppBar(),
              AppSpace.spaceH20,
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome To Retina MBO",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280),
                      ),
                    ),
                    const Text(
                      "Create your account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff111827),
                      ),
                    ),
                    AppSpace.spaceH20,
                    CustomTextformField(
                      controller: controller.fullNameController,
                      height: controller.texfH1.isFalse ? 55 : 90,
                      textAlign: TextAlign.start,
                      labelText: "Full Name",
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: AppColors.grey,
                        size: 24,
                      ),
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          controller.texfH1.value = true;
                          return 'PleaseEnterYourFullName';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    AppSpace.spaceH16,
                    CustomTextformField(
                      controller: controller.emailController,
                      height: controller.texfH2.isFalse ? 55 : 90,
                      textAlign: TextAlign.start,
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: AppColors.grey,
                        size: 24,
                      ),
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          controller.texfH2.value = true;
                          return 'PleaseEnterYourEmail';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    AppSpace.spaceH16,
                    CustomTextformField(
                      controller: controller.phoneumberController,
                      height: controller.texfH3.isFalse ? 55 : 90,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      labelText: "Phone Number",
                      prefixIcon: Icon(
                        Icons.phone_in_talk_outlined,
                        color: AppColors.grey,
                        size: 24,
                      ),
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          controller.texfH3.value = true;
                          return 'PleaseEnterYourPhoneNumber';
                        }
                        return null;
                      },
                    ),
                    AppSpace.spaceH16,
                    CustomTextformField(
                      controller: controller.businessNameController,
                      height: controller.texfH4.isFalse ? 55 : 90,
                      textAlign: TextAlign.start,
                      labelText: "Business Name",
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: AppColors.grey,
                        size: 24,
                      ),
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty || value == '') {
                          controller.texfH4.value = true;
                          return 'PleaseEnterYourBusinessName';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                    ),
                    
                    AppSpace.spaceH24,
                    InkWell(
                      onTap: () async {
                        FocusScope.of(Get.overlayContext!)
                            .requestFocus(FocusNode());
                        if (controller.registrationFormKey.currentState!
                            .validate()) {
                          print("Registration Form Valide");
                          print("Email : ${controller.emailController.text}");
                          print("name : ${controller.fullNameController.text}");
                          await controller.submittedRegisterCon();
                        }
                        //Get.toNamed(Routes.HOME);
                        else {
                          print("Registration Form Not Valide");
                        }
                      },
                      child: Obx(() => Container(
                            height: 50,
                            width: Get.width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.appcolor),
                            child: controller.isLoadingRegister.value == true
                                ? const Text(
                                    'Sign Up',
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
                                  )),
                            // const Text(
                            //   "Update",
                            //   style: TextStyle(fontSize: 18, color: Colors.white),
                            // ),
                          )),
                    ),
                    AppSpace.spaceH20,
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                              text: 'Sign In',
                              style: const TextStyle(
                                  color: AppColors.appcolor,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.back();
                                  print("click");
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSpace.spaceH20,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}