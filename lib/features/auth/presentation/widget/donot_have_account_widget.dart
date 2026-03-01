import 'dart:ui';
import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/extension/navigator_app.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/auth/presentation/screen/signup_screen.dart';
import 'package:flutter/material.dart';

class DonotHaveAccountWidget extends StatelessWidget {
  const DonotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text(
          AppText.dontHaveAccount,
          style: getSmallStyle(color: AppColor.white),
        ),
        InkWell(
          onTap: () {
            context.push(SignupScreen());
          },
          child: Text(
            AppText.register,
            style: getSmallStyle(
              color: AppColor.accentColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
