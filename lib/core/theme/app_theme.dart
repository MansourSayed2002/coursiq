import 'package:coursiq/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const String fontFamily = 'Poppins';

  static ThemeData light = ThemeData(
    fontFamily: fontFamily,
    scaffoldBackgroundColor: AppColor.backgroundSpecial,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.backgroundSpecial,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColor.white,
        fontWeight: FontWeight.bold,
        fontSize: 18.0.sp,
      ),
    ),
  );
}
