import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../values/app_colors.dart';
import '../values/app_space.dart';

class Helpers {
  Helpers._();

  static AppBar customAppbar(String title) {
    return AppBar(
      backgroundColor: Get.theme.primaryColor,
      centerTitle: false,
      scrolledUnderElevation: 0.0,
      title: Text(
        title.tr,
        style: Get.theme.appBarTheme.titleTextStyle,
      ),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back,
          color: Get.theme.iconTheme.color,
        ),
      ),
    );
  }

  static BoxDecoration createButtonDecoration({double? radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      color: Colors.grey.withOpacity(0.13),
    );
  }

  static BoxDecoration customCircularDecoretion(
      BuildContext context, Color? color, double value) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(value),
    );
  }
  

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static void snackbarForErorr({
    required String titleText,
    required String bodyText,
    double? topMargin,
  }) {
    Get.snackbar(titleText, bodyText,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(
            top: topMargin ?? Get.height * 0.0,
            left: Get.width * 0.05,
            right: Get.width * 0.05),
        backgroundColor: AppColors.red.withOpacity(0.9),
        colorText: Colors.white);
  }

  static void snackbarForSucess({
    required String titleText,
    required String bodyText,
    double? topMargin,
  }) {
    Get.snackbar(titleText, bodyText,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(
            top: topMargin ?? Get.height * 0.0,
            left: Get.width * 0.05,
            right: Get.width * 0.05),
        // backgroundColor: fromHex('#E9A9AF'),
        backgroundColor: Colors.black,
        colorText: Colors.white);
  }

  static void showSnackBarBuild(
      {required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      backgroundColor: Get.theme.primaryColor,
      content: Text(
        message,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static double calculateFontSize(double screenWidth) {
    if (screenWidth > 450) {
      return 14.0;
    } else if (screenWidth > 350) {
      return 13.0;
    } else if (screenWidth > 320) {
      return 12.0;
    } else {
      return 10.0;
    }
  }

  static monthYear(String dateStart) {
    DateFormat inputFormat = DateFormat('dd/MM/yyyy hh:mm:ss a');
    DateTime input = inputFormat.parse(dateStart);
    String result = DateFormat('MM/yyyy').format(input);
    return result;
  }

  //
  static openDialog(void Function()? onPressed) {
    Get.dialog(
      AlertDialog(
        //title: const Text('Are Yor Sure?'),

        elevation: 0.0,
        titlePadding: EdgeInsets.zero,
        // content: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     AppSpace.spaceH10,
        //     const Text(
        //       "আপনাকে লগইন করতে হবে।\n আপনি কি রাজি?",
        //       textAlign: TextAlign.center,
        //     ),
        //   ],
        // ),
        //আপনাকে লগইন করতে হবে।\n আপনি কি রাজি?
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSpace.spaceH20,
              const Text(
                "You need to login to use this \nFeature",
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        minimumSize: const Size(80, 20),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      child: const Text(
                        "No",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Get.theme.primaryColor,
                        minimumSize: const Size(80, 20),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        textStyle: const TextStyle(fontSize: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      child: const Text("Yes",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //passwordVisivilityMethod
  static IconButton passwordVisivilityMethod(
      void Function()? onPressed, bool isVisible) {
    return IconButton(
      splashColor: Colors.transparent,
      onPressed: onPressed,
      icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
    );
  }

  static String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  static InputDecoration textInputDecoration([
    TextEditingController? controller,
    String? lableText = "",
    String? hintText,
    prefixIcon,
    suffixIcon,
    EdgeInsetsGeometry? contentPadding,
  ]) {
    return InputDecoration(
      labelText: lableText,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.red),
      ),
      labelStyle: TextStyle(color: AppColors.primaryColor),

      /*suffix: IconButton(
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        highlightColor: CtmColors.appColor,
        onPressed: controller!.clear,
        icon:  //icon2,
      ),*/

      //const Icon(Icons.person),
      //fillColor: Colors.grey.shade100,
      filled: true,
      contentPadding:
          contentPadding ?? const EdgeInsets.fromLTRB(15, 10, 20, 30),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppColors.grey, width: 0.5)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppColors.grey, width: 0.5)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppColors.white, width: 0.5)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppColors.white, width: 0.5)),
    );
  }
}

extension HexColorApp on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension DateTimeFormat on DateTime {
  String get ddMMyy => DateFormat("dd-MM-yy").format(this);
  String ddMMyyyy(String formate) {
    return DateFormat(formate).format(this);
  }

  String get yyyDDmm => DateFormat("yyyy-MM-dd").format(this);
  String get mmYYYY => DateFormat("MM-yyyy").format(this);
  String get mmDDyyHHmmA => DateFormat('MM/dd/yyyy hh:mm a').format(this);
  String get yyyDDmmNumber => DateFormat("yyyyMMdd").format(this);
}

ButtonStyle elevatedButtonStyleCustom(double width) => ElevatedButton.styleFrom(
      backgroundColor: AppColors.appcolor,
      minimumSize: Size(width * .8, 40),
      padding: const EdgeInsets.symmetric(vertical: 15),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    );

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

// WillPopScopeForStopBackspace

class WillPopScopeForStopBackspace extends StatelessWidget {
  const WillPopScopeForStopBackspace({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return false;
        } else {
          return true;
        }
      },
      child: child,
    );
  }
}

Widget createBoxShap(
    {required Widget child,
    double height = 0,
    Color color = Colors.white,
    double padding = 0}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: padding),
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              blurRadius: 5,
              color: HexColor('#000000').withOpacity(0.15),
              offset: const Offset(0, 0))
        ]),
    child: child,
  );
}

customButton(
    {void Function()? onTap,
    Color? color = AppColors.appcolor,
    required String text,
    TextStyle? style}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 55,
      width: Get.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: style,
      ),
    ),
  );
}

simpleAppBar({String? title}) {
  return InkWell(
    onTap: () => Get.back(),
    child: Container(
      height: 60,
      width: Get.width,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              // color: Colors.white,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(
                  color: Colors.white10,
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(2, 2),
                ),
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(-1, -1),
                ),
              ],
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
              size: 18,
            ),
          ),
          Align(alignment: Alignment.center, child: Text(title ?? "")),
          const SizedBox(width: 20),
        ],
      ),
    ),
  );
}
