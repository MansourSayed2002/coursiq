import 'package:coursiq/core/extension/navigator_app.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowBackButtonWidget extends StatelessWidget {
  const ArrowBackButtonWidget({super.key, this.iconData});
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },

      child: Container(
        padding: .symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        margin: .symmetric(horizontal: 8.0.w),
        decoration: BoxDecoration(
          color: AppColor.fullColor,
          shape: BoxShape.circle,
        ),
        child: Icon(iconData ?? Icons.arrow_back, color: AppColor.white),
      ),
    );
  }
}
