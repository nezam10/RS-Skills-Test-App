import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/helpers/app_helper.dart';

class CustomTextformField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? label;
  final TextStyle? style;
  final Color? color;
  final double? width;
  final double? height;
  final Decoration? decoration;
  final int? maxLength;
  final int? maxLines;
  final TextAlign textAlign;
  final bool readOnly;
  final bool? enabled;
  final TextAlignVertical? textAlignVertical;
  final EdgeInsetsGeometry? padding;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextformField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.label,
    this.onSaved,
    this.style,
    this.color,
    this.width,
    this.height,
    this.decoration,
    this.maxLength,
    this.maxLines,
    //

    required this.textAlign,
    this.padding,
    this.onChanged,
    this.inputFormatters,
    this.enabled,
    this.textAlignVertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
      alignment: Alignment.center,
      decoration: decoration,
      padding: padding,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        onSaved: onSaved,
        style: style,
        maxLength: maxLength,
        maxLines: maxLines,
        readOnly: readOnly,
        enabled: enabled,
        textAlign: textAlign,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        textAlignVertical: textAlignVertical,
        decoration: Helpers.textInputDecoration(controller, hintText, labelText,
            prefixIcon, suffixIcon, contentPadding),
        /*  decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          label: label,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Color(0xFF9A9A9A)),
        ),*/
      ),
    );
  }
}
