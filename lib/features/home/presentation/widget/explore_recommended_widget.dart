import 'package:cached_network_image/cached_network_image.dart';
import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/extension/navigator_app.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/details/presentation/screen/details_screen.dart';
import 'package:coursiq/features/home/data/model/recommended_courses_model.dart';
import 'package:coursiq/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ExploreRecommendedWidget extends StatelessWidget {
  const ExploreRecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeCoursesLoading ||
          current is HomeCoursesSuccess ||
          current is HomeCoursesError,
      builder: (context, state) {
        if (state is HomeCoursesLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.accentColor),
          );
        } else if (state is HomeCoursesError) {
          return Center(
            child: Column(
              children: [
                Icon(Icons.warning, color: AppColor.yellowColor, size: 30.0.sp),
                Text(state.message, style: getSmallStyle()),
              ],
            ),
          );
        } else if (state is HomeCoursesSuccess) {
          return SizedBox(
            height: 300.0.h,
            width: double.infinity,
            child: ListView.builder(
              itemCount: state.courses.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CardCoursesWidget(model: state.courses[index]);
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

class CardCoursesWidget extends StatelessWidget {
  const CardCoursesWidget({super.key, required this.model});
  final RecommendedCoursesModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(DetailsScreen(recommendedCoursesModel: model));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: .symmetric(horizontal: 16.0.w, vertical: 10.0.h),
        margin: .symmetric(horizontal: 8.0.w, vertical: 8.0.h),
        decoration: BoxDecoration(
          borderRadius: .circular(20.0.r),
          color: AppColor.accentColor.withAlpha(20),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Stack(
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
                Positioned(
                  top: 5.0.h,
                  right: 10.0.w,
                  child: Container(
                    padding: .symmetric(horizontal: 10.0.w, vertical: 5.0.h),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: .circular(20.0.r),
                      color: AppColor.black.withAlpha(40),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColor.yellowColor,
                          size: 15.0.sp,
                        ),
                        Gap(2.0.w),
                        Text(
                          model.rating.toString(),
                          style: getSmallStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gap(8.0.h),
            Text(
              model.category.toString(),
              style: getSmallStyle(color: AppColor.accentColor),
            ),
            Gap(10.0.h),
            Expanded(
              child: Text(
                model.title.toString(),
                style: getBodyStyle(context: context, fontSize: 16.0.sp),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Gap(5.0.h),
            Row(
              children: [
                Icon(
                  Icons.play_circle_fill_rounded,
                  color: AppColor.grey,
                  size: 15.0.sp,
                ),
                Gap(5.0.w),
                Text("${model.lescture} Lessons", style: getSmallStyle()),
                Gap(20.0.w),
                Icon(Icons.timer, color: AppColor.grey, size: 15.0.sp),
                Gap(5.0.w),
                Text("${model.durationHours}h", style: getSmallStyle()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderRecommendedWidget extends StatelessWidget {
  const HeaderRecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppText.recommendedForYou,
          style: getBodyStyle(context: context, fontSize: 18.0.sp),
        ),
        Spacer(),
        InkWell(
          onTap: () {},
          splashColor: AppColor.accentColor.withAlpha(20),
          borderRadius: .circular(20.0.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
            child: Text(
              AppText.viewAll,
              style: getSmallStyle(color: AppColor.accentColor),
            ),
          ),
        ),
      ],
    );
  }
}
