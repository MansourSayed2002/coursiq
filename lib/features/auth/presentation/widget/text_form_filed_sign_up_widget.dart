import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/core/widget/custom_text_from_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFiledSignUpWidget extends StatelessWidget {
  const TextFormFiledSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          AppText.fullName,
          style: getSmallStyle(fontSize: 14.0.sp, color: AppColor.greyColorCB),
        ),
        Gap(8.0.h),
        SizedBox(
          height: 55.0.h,
          child: CustomTextFormGlobal(
            cursorColor: AppColor.accentColor,
            hinttext: AppText.hintFullName,
            prefixIcon: Icon(
              Icons.person_2_outlined,
              color: AppColor.greyColor64,
            ),
          ),
        ),
        Gap(20.0.h),
        Text(
          AppText.email,
          style: getSmallStyle(fontSize: 14.0.sp, color: AppColor.greyColorCB),
        ),
        Gap(8.0.h),
        SizedBox(
          height: 55.0.h,
          child: CustomTextFormGlobal(
            cursorColor: AppColor.accentColor,
            hinttext: AppText.hintEmail,
            prefixIcon: Icon(Icons.email_outlined, color: AppColor.greyColor64),
          ),
        ),
        Gap(20.0.h),
        Text(
          AppText.password,
          style: getSmallStyle(fontSize: 14.0.sp, color: AppColor.greyColorCB),
        ),
        Gap(8.0.h),
        SizedBox(
          height: 55.0.h,
          child: CustomTextFormGlobal(
            cursorColor: AppColor.accentColor,
            hinttext: AppText.hintPassword,
            prefixIcon: Icon(Icons.lock_outline, color: AppColor.greyColor64),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.visibility_off_outlined,
                color: AppColor.greyColor64,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
