import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WellComeWidget extends StatelessWidget {
  const WellComeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: .symmetric(horizontal: 15.0.w, vertical: 15.0.h),
          decoration: BoxDecoration(
            color: AppColor.accentColor.withAlpha(50),
            borderRadius: .circular(15.0.r),
          ),
          child: Icon(Icons.school_outlined, color: AppColor.accentColor),
        ),
        Gap(15.0.h),
        Text(
          AppText.wellcome,
          style: getTitleStyle(context: context, fontSize: 30.0.sp),
        ),
        Text(
          AppText.continueUpgrading,
          style: getSmallStyle(color: AppColor.white),
        ),
      ],
    );
  }
}
