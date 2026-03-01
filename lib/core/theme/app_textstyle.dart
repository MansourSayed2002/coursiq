import 'package:coursiq/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

TextStyle getTitleStyle({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  required BuildContext context,
}) => TextStyle(
  fontSize: fontSize ?? 24.0,
  fontWeight: fontWeight ?? FontWeight.bold,
  color: color ?? AppColor.white,
);

TextStyle getBodyStyle({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  required BuildContext context,
}) => TextStyle(
  fontSize: fontSize ?? 16.0,
  fontWeight: fontWeight ?? FontWeight.bold,
  color: color ?? AppColor.white,
);

TextStyle getSmallStyle({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  double? height,
}) => TextStyle(
  fontSize: fontSize ?? 12.0,
  fontWeight: fontWeight ?? FontWeight.w400,
  color: color ?? AppColor.grey,
  height: height,
);
