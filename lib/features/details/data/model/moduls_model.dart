class ModulsModel {
  int? id;
  String? title;
  num? number;
  ModulsModel({this.title, this.number});

  ModulsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    number = json['number'];
  }
}
