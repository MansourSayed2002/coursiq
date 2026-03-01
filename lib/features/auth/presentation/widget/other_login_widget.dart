import 'package:coursiq/core/constants/app_image.dart';
import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherLoginWidget extends StatelessWidget {
  const OtherLoginWidget({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 2.0.h,
                color: AppColor.white,
                margin: .only(right: 10.0.w),
              ),
            ),
            Text(
              AppText.orContinueWith,
              style: getSmallStyle(color: AppColor.greyColor64),
            ),
            Expanded(
              child: Container(
                height: 2.0.h,
                margin: .only(left: 10.0.w),
                color: AppColor.white,
              ),
            ),
          ],
        ),
        Gap(20.0.h),
        GoogleButtonWidget(label: label),
      ],
    );
  }
}

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: .symmetric(vertical: 15.0.h, horizontal: 15.0.w),
        decoration: BoxDecoration(
          color: AppColor.fullColor,
          borderRadius: .circular(20.0.r),
          border: .all(color: AppColor.white.withAlpha(80)),
        ),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Image.asset(AppImage.google, width: 30.0.w),
            Gap(10.0.w),
            Text(
              label,
              style: getBodyStyle(
                context: context,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
