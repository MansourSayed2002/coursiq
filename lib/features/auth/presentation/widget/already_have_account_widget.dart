import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/extension/navigator_app.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text(
          AppText.alreadyHaveAccount,
          style: getSmallStyle(color: AppColor.white),
        ),
        InkWell(
          onTap: () {
            context.pop();
          },
          child: Text(
            AppText.login,
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
