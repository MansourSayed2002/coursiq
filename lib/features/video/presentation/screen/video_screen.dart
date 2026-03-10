import 'package:coursiq/core/constants/app_text.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/core/widget/arrow_back_button_widget.dart';
import 'package:coursiq/features/video/data/model/videos_model.dart';
import 'package:coursiq/features/video/presentation/widget/card_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({
    super.key,
    required this.currentVideo,
    required this.videos,
  });
  final VideosCourseModel currentVideo;
  final List<VideosCourseModel> videos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentVideo.videoTitle),
        leading: ArrowBackButtonWidget(),
      ),
      body: Padding(
        padding: .symmetric(horizontal: 15.0.w, vertical: 15.0.h),
        child: CustomBody(currentVideo: currentVideo, videos: videos),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
    required this.currentVideo,
    required this.videos,
  });
  final VideosCourseModel currentVideo;
  final List<VideosCourseModel> videos;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Container(
          width: double.infinity,
          height: 200.0.h,
          decoration: BoxDecoration(
            color: AppColor.accentColor,
            borderRadius: .circular(15.0.r),
          ),
        ),
        Gap(20.0.h),
        Text(
          AppText.courseSyllabus,
          style: getTitleStyle(context: context, fontSize: 22.0.sp),
        ),
        Gap(10.0.h),
        Expanded(
          child: ListView.builder(
            itemCount: videos.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                CardVideoWidget(video: videos[index], videos: videos),
          ),
        ),
      ],
    );
  }
}
