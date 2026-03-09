import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/home/data/model/recommended_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.model});
  final RecommendedCoursesModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        ClipRRect(
          borderRadius: .circular(15.0.r),
          child: CachedNetworkImage(
            imageUrl: model.imageUrl.toString(),
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: AppColor.accentColor,
                padding: .all(10.0.h),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Gap(10.0.h),
        Container(
          padding: .all(5.0.h),
          decoration: BoxDecoration(
            color: AppColor.accentColor.withAlpha(20),
            borderRadius: .circular(15.0.r),
          ),
          child: Text(
            model.category.toString(),
            style: getBodyStyle(context: context, color: AppColor.accentColor),
          ),
        ),
        Gap(10.0.h),
        Text(
          model.title.toString(),
          style: getBodyStyle(context: context),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Gap(5.0.h),
        Row(
          children: [
            Icon(Icons.star, color: AppColor.yellowColor, size: 15.0.sp),
            Gap(2.0.w),
            Text(
              model.rating.toString(),
              style: getSmallStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0.sp,
                color: AppColor.white,
              ),
            ),
            Gap(5.0.w),
            Text("(${model.reviews}K reviews)", style: getSmallStyle()),
            Gap(10.0.w),
            Icon(Icons.timer, color: AppColor.grey, size: 15.0.sp),
            Gap(5.0.w),
            Text("${model.durationHours}h", style: getSmallStyle()),
          ],
        ),
      ],
    );
  }
}
