class CategoriesModel {
  final String? title;
  final String? icon;
  final String? color;

  CategoriesModel({this.title, this.icon, this.color});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      title: json['title'],
      icon: json['icon'],
      color: json['color'],
    );
  }
}
