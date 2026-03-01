import 'dart:ui';
import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/core/widget/custom_elevated_button.dart';
import 'package:coursiq/features/auth/presentation/widget/other_login_widget.dart';
import 'package:coursiq/features/auth/presentation/widget/text_form_filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputsBodyWidget extends StatelessWidget {
  const InputsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(20.0.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          margin: .only(bottom: MediaQuery.of(context).size.height / 9),
          padding: .symmetric(horizontal: 25.0.w, vertical: 25.0.h),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(10),
            borderRadius: .circular(20.0.r),
            border: Border.all(color: Colors.white.withAlpha(10), width: 0.5.w),
          ),
          child: Column(
            children: [
              TextFormFiledWidget(),
              Gap(12.0.h),
              Row(
                mainAxisAlignment: .end,
                children: [
                  Text(
                    AppText.forgetPassword,
                    style: getSmallStyle(
                      color: AppColor.accentColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Gap(32.0.h),
              SizedBox(
                width: double.infinity,
                height: 60.0.h,
                child: CustomElevatedButton(title: AppText.login, onTap: () {}),
              ),
              Gap(20.0.h),
              OtherLoginWidget(label: AppText.continueWithGoogle),
            ],
          ),
        ),
      ),
    );
  }
}
