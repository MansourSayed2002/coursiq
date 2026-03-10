import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ErrorScreen extends StatelessWidget {
  final String message;

  const ErrorScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.sentiment_dissatisfied_rounded,
                  size: 120,
                  color: Colors.redAccent.withAlpha(80),
                ),
                Gap(30.0.h),
                Text(
                  AppText.opps,
                  style: getTitleStyle(
                    context: context,
                    color: AppColor.black,
                    fontSize: 35.0.sp,
                  ),
                ),
                Gap(16.0.h),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: getBodyStyle(
                    context: context,
                    color: Colors.grey[800],
                  ).copyWith(height: 1.4),
                ),
                Gap(40.0.h),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.refresh_rounded),
                  label: Text(AppText.tryagain),
                  style: ElevatedButton.styleFrom(
                    padding: .symmetric(horizontal: 40.0.w, vertical: 16.0.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: AppColor.accentColor,
                    foregroundColor: Colors.white,
                    elevation: 6.0,
                  ),
                ),
                Gap(20.0.h),
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamedAndRemoveUntil('/', (route) => false);
                  },
                  child: Text(
                    AppText.returnToTheHomePage,
                    style: TextStyle(color: AppColor.accentColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
