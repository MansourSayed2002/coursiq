class VideoModel {
  String? time;
  String? urlVideo;
  int? visability;
  String? titleVideo;

  VideoModel({this.time, this.titleVideo, this.urlVideo, this.visability});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      time: json['time'],
      urlVideo: json['url'],
      visability: json['visability'],
      titleVideo: json['video_title'],
    );
  }
}
