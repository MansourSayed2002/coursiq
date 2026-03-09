class BannerModel {
  String? imageBanner;

  BannerModel({this.imageBanner});

  BannerModel.fromJson(Map<String, dynamic> json) {
    imageBanner = json['image'];
  }
}
