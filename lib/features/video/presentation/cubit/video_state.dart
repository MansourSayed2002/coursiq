part of 'video_cubit.dart';

@immutable
sealed class VideoState {}

final class VideoInitial extends VideoState {}

final class GetVideoLoading extends VideoState {}

final class GetVideoSuccess extends VideoState {
  final List<VideosCourseModel> videos;

  GetVideoSuccess({required this.videos});
}

final class GetVideoError extends VideoState {
  final String message;

  GetVideoError({required this.message});
}
