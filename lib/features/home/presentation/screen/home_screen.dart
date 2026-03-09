import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/di/di.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/home/presentation/cubit/home_cubit.dart';
import 'package:coursiq/features/home/presentation/widget/banner_widget.dart';
import 'package:coursiq/features/home/presentation/widget/custom_appbar_widget.dart';
import 'package:coursiq/features/home/presentation/widget/explore_categories.dart';
import 'package:coursiq/features/home/presentation/widget/explore_recommended_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomeCubit>()
        ..getCategories()
        ..getRecommendedCourses()
        ..getBanner(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0.h),
          child: CustomAppbarWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: CircleBorder(),
          backgroundColor: AppColor.accentColor,
          child: Icon(Icons.search, color: AppColor.white),
        ),
        body: Padding(
          padding: .symmetric(horizontal: 15.0.w, vertical: 15.0.h),
          child: ListView(
            children: [
              BannerWidget(),
              Gap(12.0.h),
              HeaderRecommendedWidget(),
              ExploreRecommendedWidget(),
              Gap(12.0.h),
              Text(
                AppText.exploreCategories,
                style: getBodyStyle(context: context, fontSize: 18.0.sp),
              ),
              Gap(10.0.h),
              ExploreCategories(),
            ],
          ),
        ),
      ),
    );
  }
}
