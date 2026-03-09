import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/home/data/model/recommended_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.recommendedCoursesModel,
  });
  final RecommendedCoursesModel recommendedCoursesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 20.0.w, vertical: 10.0.h),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(AppText.price, style: getSmallStyle()),
                Text(
                  "\$${recommendedCoursesModel.price.toString()}",
                  style: getBodyStyle(context: context),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.accentColor,
              ),
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    AppText.enrolnNow,
                    style: getBodyStyle(context: context),
                  ),
                  Icon(Icons.arrow_forward, color: AppColor.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
