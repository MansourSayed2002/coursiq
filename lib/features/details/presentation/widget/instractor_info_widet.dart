import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/home/data/model/recommended_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InstractorInfoWidet extends StatelessWidget {
  const InstractorInfoWidet({super.key, required this.model});
  final RecommendedCoursesModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 15.0.w, vertical: 15.0.h),
      decoration: BoxDecoration(
        color: AppColor.fullColor,
        borderRadius: .circular(15.0.r),
        border: .all(color: AppColor.greyColor64),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: .circular(15.0.r),
            child: CachedNetworkImage(
              imageUrl: model.imageInstractor.toString(),
              width: 55.0.w,
              height: 55.0.h,
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
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(AppText.instractor, style: getSmallStyle()),
              Gap(5.h),
              Text(
                model.nameInstractor.toString(),
                style: getBodyStyle(context: context),
              ),
            ],
          ),
          Spacer(),
          Text(
            AppText.follow,
            style: getBodyStyle(context: context, color: AppColor.accentColor),
          ),
        ],
      ),
    );
  }
}
