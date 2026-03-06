import 'dart:ui';
import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/features/auth/presentation/widget/other_login_widget.dart';
import 'package:coursiq/features/auth/presentation/widget/text_form_filed_sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InputsBodySignUpWidget extends StatelessWidget {
  const InputsBodySignUpWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(20.0.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: .symmetric(horizontal: 15.0.w, vertical: 25.0.h),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(10),
            borderRadius: .circular(20.0.r),
            border: Border.all(color: Colors.white.withAlpha(10), width: 0.5.w),
          ),
          child: Column(
            children: [
              TextFormFiledSignUpWidget(),
              Gap(20.0.h),
              OtherLoginWidget(label: AppText.signUpWithGoogle),
            ],
          ),
        ),
      ),
    );
  }
}
