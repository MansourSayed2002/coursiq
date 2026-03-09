import 'package:coursiq/core/constants/app_image.dart';
import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: .symmetric(horizontal: 15.0.w),
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset(
                AppImage.man,
                width: 50.0.w,
                fit: BoxFit.cover,
              ),
            ),
            Gap(5.0.w),
            Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [
                Text(
                  AppText.wellcome,
                  style: getSmallStyle(color: AppColor.white),
                ),
                Text(
                  "mansour sayed",
                  style: getBodyStyle(context: context),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: .symmetric(horizontal: 10.0.w, vertical: 5.0.h),
              decoration: BoxDecoration(
                borderRadius: .circular(20.0.r),
                border: .all(color: AppColor.accentColor, width: .6),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: AppColor.accentColor,
                  ),
                  Gap(2.0.w),
                  Text(
                    "12",
                    style: getSmallStyle(
                      color: AppColor.accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
