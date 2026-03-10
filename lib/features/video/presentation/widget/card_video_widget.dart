import 'package:coursiq/core/function/format_number.dart';
import 'package:coursiq/core/theme/app_color.dart';
import 'package:coursiq/core/theme/app_textstyle.dart';
import 'package:coursiq/features/video/data/model/videos_model.dart';
import 'package:coursiq/features/video/presentation/screen/videos_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CardVideoWidget extends StatelessWidget {
  const CardVideoWidget({super.key, required this.video, required this.videos});
  final VideosCourseModel video;
  final List<VideosCourseModel> videos;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            "${formatNumber(int.tryParse(video.numberVideo.toString()) ?? 0)}.",
            style: getBodyStyle(context: context),
          ),
          Expanded(
            child: Text(
              video.videoTitle.toString(),
              style: getBodyStyle(context: context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Text(video.videoTime.toString(), style: getSmallStyle()),
          Gap(10.0.w),
          buildVideoStatus(
            video,
            videos.firstWhere((video) => video.completed == false),
          ),
        ],
      ),
      leading: Container(
        width: 40.0.w,
        height: 40.0.h,
        decoration: BoxDecoration(
          color: video.completed ? AppColor.accentColor : AppColor.greyColorB8,
          shape: BoxShape.circle,
          border: .all(color: AppColor.white),
        ),
        child: Icon(
          video.completed ? Icons.done : Icons.lock,
          color: video.completed ? AppColor.white : AppColor.accentColor,
          size: 15.0.sp,
        ),
      ),
    );
  }
}
