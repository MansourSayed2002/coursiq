import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeBannerLoading ||
          current is HomeBannerSuccess ||
          current is HomeBannerError,
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
        } else if (state is HomeBannerSuccess) {
          return CarouselSlider.builder(
            itemCount: state.banner.length,
            itemBuilder: (context, index, realIndex) => ClipRRect(
              borderRadius: .circular(10.0.r),
              child: CachedNetworkImage(
                imageUrl: state.banner[index].imageBanner.toString(),
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColor.accentColor,
                    padding: .all(10.0.h),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              initialPage: 0,
              enableInfiniteScroll: true,
              viewportFraction: .9,
              enlargeCenterPage: true,
              reverse: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
