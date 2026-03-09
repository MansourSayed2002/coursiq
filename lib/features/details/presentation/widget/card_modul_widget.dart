import 'package:coursiq/core/di/di.dart';
import 'package:coursiq/core/function/format_number.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/details/data/model/moduls_model.dart';
import 'package:coursiq/features/details/data/repo/details_repo.dart';
import 'package:coursiq/features/details/presentation/cubit/details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CardModulWidget extends StatelessWidget {
  const CardModulWidget({super.key, required this.modulsModel});
  final ModulsModel modulsModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          DetailsCubit(getIt<DetailsRepo>())..getvideo(modulsModel.id ?? 0),
      child: Container(
        width: double.infinity,
        margin: .symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        padding: .symmetric(horizontal: 5.0.w, vertical: 10.0.h),
        decoration: BoxDecoration(
          color: AppColor.accentColor.withAlpha(10),
          borderRadius: .circular(15.0.r),
        ),
        child: ExpansionTile(
          iconColor: AppColor.backgroundColorLight,
          title: HearderExpansion(modulsModel: modulsModel),
          children: [
            BlocBuilder<DetailsCubit, DetailsState>(
              buildWhen: (previous, current) =>
                  current is DetailsVideoLoading ||
                  current is DetailsVideoSuccess ||
                  current is DetailsVideoError,
              builder: (context, state) {
                if (state is DetailsVideoLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.accentColor,
                    ),
                  );
                } else if (state is DetailsVideoError) {
                  return Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.warning,
                          color: AppColor.yellowColor,
                          size: 30.0.sp,
                        ),
                        Text(state.message, style: getSmallStyle()),
                      ],
                    ),
                  );
                } else if (state is DetailsVideoSuccess) {
                  return ListView.builder(
                    itemCount: state.video.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: .symmetric(horizontal: 20.0.w, vertical: 10.0.h),
                      child: Row(
                        children: [
                          Container(
                            padding: .symmetric(
                              horizontal: 8.0.w,
                              vertical: 8.0.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.accentColor.withAlpha(20),
                              shape: BoxShape.circle,
                              border: .all(
                                color: AppColor.greyColorCB,
                                width: .3,
                              ),
                            ),
                            child: Icon(
                              Icons.play_circle_filled,
                              color: AppColor.greyColorB8,
                              size: 10.0.sp,
                            ),
                          ),
                          Gap(20.0.w),
                          Expanded(
                            child: Text(
                              state.video[index].titleVideo.toString(),
                              style: getBodyStyle(
                                context: context,
                                fontSize: 14.0.sp,
                              ),
                            ),
                          ),
                          Gap(15.0.w),
                          Icon(
                            Icons.lock,
                            color: AppColor.greyColor69,
                            size: 15.0.sp,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HearderExpansion extends StatelessWidget {
  const HearderExpansion({super.key, required this.modulsModel});
  final ModulsModel modulsModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Container(
          padding: .symmetric(horizontal: 10.0.w, vertical: 10.0.h),
          decoration: BoxDecoration(
            borderRadius: .circular(15.0.r),
            color: AppColor.accentColor.withAlpha(20),
          ),
          child: Text(
            formatNumber(modulsModel.number ?? 0),
            style: getBodyStyle(context: context),
          ),
        ),
        Gap(10.0.w),
        Expanded(
          child: Text(
            modulsModel.title.toString(),
            style: getBodyStyle(context: context, color: AppColor.accentColor),
          ),
        ),
      ],
    );
  }
}
