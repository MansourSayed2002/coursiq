import 'package:coursiq/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormGlobal extends StatelessWidget {
  const CustomTextFormGlobal({
    super.key,
    required this.hinttext,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.obscureText,
    this.onChanged,
    this.prefixIcon,
    this.height,
    this.readOnly,
    this.maxLines = 1,
    this.onTap,
    this.focusNode,
    this.keyboardType,
    this.labelText,
    this.cursorColor,
  });
  final String hinttext;
  final String? labelText;
  final double? height;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final bool? readOnly;
  final int? maxLines;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final Color? cursorColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      cursorColor: cursorColor ?? AppColor.primaryColor,
      style: TextStyle(fontSize: 16.0.sp, color: AppColor.white),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: AppColor.fullColor,
        labelText: labelText,
        hintText: hinttext,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        hintTextDirection: TextDirection.ltr,
        hintStyle: TextStyle(fontSize: 16.0.sp, color: AppColor.greyColor64),
        labelStyle: TextStyle(fontSize: 16.0.sp, color: AppColor.greyColor64),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0.r),
          borderSide: BorderSide(color: AppColor.fullColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0.r),
          borderSide: BorderSide(color: AppColor.fullColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0.r),
          borderSide: BorderSide(color: AppColor.fullColor),
        ),
      ),
    );
  }
}
