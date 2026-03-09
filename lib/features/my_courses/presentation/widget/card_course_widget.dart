import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/my_courses/data/model/mycourse_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CardCourseWidget extends StatelessWidget {
  const CardCourseWidget({super.key, required this.mycourseModel});
  final MycourseModel mycourseModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: .symmetric(horizontal: 8.0.w, vertical: 15.0.h),
            decoration: BoxDecoration(
              borderRadius: .circular(25.0.r),
              color: AppColor.accentColor.withAlpha(20),
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                ClipRRect(
                  borderRadius: .only(
                    topLeft: .circular(25.0.r),
                    topRight: .circular(25.0.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: mycourseModel.imageUrl.toString(),
                    width: double.infinity,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: AppColor.accentColor,
                        padding: .all(10.0.h),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Gap(15.0.h),
                Padding(
                  padding: .symmetric(horizontal: 10.0.w, vertical: 10.0.h),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        mainAxisAlignment: .start,
                        children: [
                          Expanded(
                            child: Text(
                              mycourseModel.title.toString(),
                              style: getBodyStyle(context: context),
                            ),
                          ),
                          Gap(15.0.h),
                          Text(
                            "75%",
                            style: getBodyStyle(
                              context: context,
                              color: AppColor.accentColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(10.0.h),
                      Text(
                        "${AppText.instractor}: ${mycourseModel.instructorName.toString()}",
                        style: getSmallStyle(),
                      ),
                      Gap(15.0.h),
                      SizedBox(
                        height: 15.0.h,
                        child: LinearProgressIndicator(
                          value: 75.0,
                          color: AppColor.accentColor,
                          backgroundColor: AppColor.greyColorB8,
                          borderRadius: .circular(15.0.r),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
