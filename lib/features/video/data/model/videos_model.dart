class VideosCourseModel {
  final int videoId;
  final String videoTitle;
  final String videoTime;
  final String url;
  final int visability;
  final int numberVideo;
  final int modulId;
  final bool completed;

  VideosCourseModel({
    required this.videoId,
    required this.videoTitle,
    required this.videoTime,
    required this.url,
    required this.visability,
    required this.modulId,
    required this.completed,
    required this.numberVideo,
  });

  factory VideosCourseModel.fromJson(Map<String, dynamic> json) {
    return VideosCourseModel(
      videoId: json['video_id'],
      videoTitle: json['video_title'],
      videoTime: json['video_time'],
      url: json['url'],
      visability: json['visability'],
      modulId: json['modul_id'],
      completed: json['completed'],
      numberVideo: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'video_id': videoId,
      'video_title': videoTitle,
      'video_time': videoTime,
      'url': url,
      'visability': visability,
      'modul_id': modulId,
      'completed': completed,
    };
  }
}
