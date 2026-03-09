import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ExploreCategories extends StatelessWidget {
  const ExploreCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeLoading ||
          current is HomeSuccess ||
          current is HomeErrors,
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.accentColor),
          );
        } else if (state is HomeErrors) {
          return Center(
            child: Column(
              children: [
                Icon(Icons.warning, color: AppColor.yellowColor, size: 30.0.sp),
                Text(state.message, style: getSmallStyle()),
              ],
            ),
          );
        } else if (state is HomeSuccess) {
          return Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(
                height: 120.0.h,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: (state).categories.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: .symmetric(horizontal: 16.0.w, vertical: 16.0.h),
                      child: Column(
                        children: [
                          Container(
                            padding: .symmetric(
                              horizontal: 15.0.w,
                              vertical: 15.0.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.white.withAlpha(20),
                              border: Border.all(
                                color: Color(
                                  int.parse(
                                    (state).categories[index].color.toString(),
                                  ),
                                ),
                                width: 0.5.w,
                              ),
                              borderRadius: .circular(15.0.r),
                            ),
                            child: Icon(
                              IconData(
                                int.parse(
                                  (state).categories[index].icon.toString(),
                                ),
                                fontFamily: 'MaterialIcons',
                              ),
                              color: Color(
                                int.parse(
                                  (state).categories[index].color.toString(),
                                ),
                              ),
                            ),
                          ),
                          Gap(10.0.h),
                          Text(
                            (state).categories[index].title.toString(),
                            style: getSmallStyle(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
