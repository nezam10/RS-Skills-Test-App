import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/helpers/app_helper.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_space.dart';
import '../../../global_widgets/custom_text_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.white,
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Obx(
              () => Form(
                key: controller.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Column(
                      children: [
                        AppSpace.spaceH20,
                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6B7280),
                          ),
                        ),
                        const Text(
                          "Sign in your account",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff111827),
                          ),
                        ),
                        AppSpace.spaceH26,
                        CustomTextformField(
                          controller: controller.emailController,
                          height: 55,
                          textAlign: TextAlign.start,
                          labelText: "Email or Phone",
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: AppColors.grey,
                            size: 24,
                          ),
                          suffixIcon:
                              controller.isLoadingLoginVerify.value == true
                                  ? IconButton(
                                      onPressed: () async {
                                        FocusScope.of(Get.overlayContext!)
                                            .requestFocus(FocusNode());
                                        await controller.loginOtpController();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_circle_right_outlined,
                                        color: Colors.green,
                                        size: 32,
                                      ),
                                    )
                                  : const Center(
                                      child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )),
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email or Phone';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        AppSpace.spaceH10,
                        CustomTextformField(
                          controller: controller.otpController,
                          height: 75,
                          textAlign: TextAlign.start,
                          obscureText: true,
                          //hintText: "Enter Purchase Key",
                          labelText: "OTP",
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.grey,
                            size: 24,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.grey,
                            size: 24,
                          ),
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please   Enter Your OTP';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                        ),
                        AppSpace.spaceH20,
                        InkWell(
                          onTap: controller.otpVisibility.value == false
                              ? null
                              : () async {
                                  FocusScope.of(Get.overlayContext!)
                                      .requestFocus(FocusNode());
                                  if (controller.emailController.text.isEmpty) {
                                    Helpers.snackbarForSucess(
                                        titleText: 'Alert!',
                                        bodyText: "Enter Email Or Phone");
                                  } else if (controller
                                      .otpController.text.isEmpty) {
                                    Helpers.snackbarForSucess(
                                        titleText: 'Alert!',
                                        bodyText: "Enter Otp");
                                  } else {
                                    print("Click");
                                    await controller.loginController();
                                  }
                                },
                          child: Container(
                            height: 55,
                            width: Get.width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: controller.otpVisibility.isTrue
                                    ? AppColors.appcolor
                                    : Colors.grey.shade300),
                            child: controller.isLoadingLogin.value == true
                                ? const Text(
                                    'Sign In',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )
                                : const Align(
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print("Click Resend OTP");
                            //Get.to(() => ForgotPasswordView());
                          },
                          child: const Text(
                            "Resend OTP",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff483177),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  const TextSpan(
                                      text: "Don't have an account? ",
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: const TextStyle(
                                        color: AppColors.appcolor,
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed(Routes.SIGNUP);
                                        print("click Sign Up");
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSpace.spaceH30,
                    AppSpace.spaceH20,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
