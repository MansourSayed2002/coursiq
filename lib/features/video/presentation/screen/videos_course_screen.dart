import 'dart:developer';
import 'package:coursiq/core/di/di.dart';
import 'package:coursiq/core/extension/navigator_app.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/core/widget/arrow_back_button_widget.dart';
import 'package:coursiq/features/my_courses/data/model/mycourse_model.dart';
import 'package:coursiq/features/video/data/model/videos_model.dart';
import 'package:coursiq/features/video/presentation/cubit/video_cubit.dart';
import 'package:coursiq/features/video/presentation/screen/video_screen.dart';
import 'package:coursiq/features/video/presentation/widget/card_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideosCourseScreen extends StatelessWidget {
  const VideosCourseScreen({super.key, required this.mycourseModel});
  final MycourseModel mycourseModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<VideoCubit>()..getVideo(targetId: mycourseModel.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(mycourseModel.title),
          leading: ArrowBackButtonWidget(),
        ),
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
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is GetVideoLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.accentColor),
          );
        } else if (state is GetVideoError) {
          return Center(
            child: Column(
              children: [
                Icon(Icons.warning, color: AppColor.yellowColor, size: 30.0.sp),
                Text(state.message, style: getSmallStyle()),
              ],
            ),
          );
        } else if (state is GetVideoSuccess) {
          return ListView.builder(
            itemCount: state.videos.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var video = state.videos[index];
              return InkWell(
                onTap: () {
                  context.push(
                    VideoScreen(currentVideo: video, videos: state.videos),
                  );
                },
                child: CardVideoWidget(video: video, videos: state.videos),
              );
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

Widget buildVideoStatus(
  VideosCourseModel video,
  VideosCourseModel currentVideo,
) {
  log(currentVideo.toString());
  if (video.completed) {
    return Text(
      "Completed",
      style: TextStyle(
        color: Colors.green,
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  } else if (video.videoId == currentVideo.videoId &&
      currentVideo.videoId != true) {
    return Text(
      "Currently Playing",
      style: TextStyle(
        color: AppColor.accentColor,
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
  return Text(
    "Next Lesson",
    style: TextStyle(
      color: Colors.grey,
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w500,
    ),
  );
}
