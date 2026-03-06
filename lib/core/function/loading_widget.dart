import 'package:coursiq/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> loadingWidget(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(
      child: Container(
        width: 100.0.w,
        height: 100.0.h,
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0.r),
          color: AppColor.backgroundColorLight.withAlpha(30),
        ),
        child: CircularProgressIndicator(color: AppColor.accentColor),
      ),
    ),
  );
}
