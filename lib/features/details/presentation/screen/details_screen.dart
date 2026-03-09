import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/di/di.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/core/widget/arrow_back_button_widget.dart';
import 'package:coursiq/features/details/presentation/cubit/details_cubit.dart';
import 'package:coursiq/features/details/presentation/widget/bottom_navigation_bar_widget.dart';
import 'package:coursiq/features/details/presentation/widget/header_widget.dart';
import 'package:coursiq/features/details/presentation/widget/instractor_info_widet.dart';
import 'package:coursiq/features/details/presentation/widget/modul_course_widget.dart';
import 'package:coursiq/features/home/data/model/recommended_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.recommendedCoursesModel});
  final RecommendedCoursesModel recommendedCoursesModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<DetailsCubit>()..getmoduls(recommendedCoursesModel.id ?? 1),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppText.courseDetails),
          leading: ArrowBackButtonWidget(),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          recommendedCoursesModel: recommendedCoursesModel,
        ),
        body: CustomBody(model: recommendedCoursesModel),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.model});
  final RecommendedCoursesModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 15.0.w, vertical: 15.0.h),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          HeaderWidget(model: model),
          Gap(15.0.h),
          InstractorInfoWidet(model: model),
          Gap(15.0.h),
          Text(
            AppText.aboutCourse,
            style: getBodyStyle(context: context, fontSize: 20.0.sp),
          ),
          Gap(10.0.h),
          Text(model.description.toString(), style: getSmallStyle()),
          Gap(15.0.h),
          Text(
            AppText.contentCourse,
            style: getBodyStyle(context: context, fontSize: 20.0.sp),
          ),
          ModulCourseWidget(),
        ],
      ),
    );
  }
}
