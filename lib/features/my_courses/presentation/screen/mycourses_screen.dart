
import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/di/di.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/my_courses/presentation/cubit/mycourses_cubit.dart';
import 'package:coursiq/features/my_courses/presentation/widget/card_course_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MycoursesScreen extends StatelessWidget {
  const MycoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<MycoursesCubit>()..getMyCourses(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppText.myCourses)),
        body: Padding(
          padding: .symmetric(horizontal: 15.0.w, vertical: 15.0.h),
          child: CustomBody(),
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MycoursesCubit, MycoursesState>(
      builder: (context, state) {
        if (state is MycoursesLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.accentColor),
          );
        } else if (state is MycoursesError) {
          return Center(
            child: Column(
              children: [
                Icon(Icons.warning, color: AppColor.yellowColor, size: 30.0.sp),
                Text(state.message, style: getSmallStyle()),
              ],
            ),
          );
        } else if (state is MycoursesSuccess) {
          return ListView.builder(
            itemCount: state.myCourse.length,
            itemBuilder: (context, index) =>
                CardCourseWidget(mycourseModel: state.myCourse[index]),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
