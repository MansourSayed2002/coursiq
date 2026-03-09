class RecommendedCoursesModel {
  int? id;
  String? title;
  String? description;
  String? imageUrl;
  String? category;
  num? lescture;
  num? durationHours;
  num? price;
  num? reviews;
  num? rating;
  String? nameInstractor;
  String? bioInstractor;
  String? imageInstractor;

  RecommendedCoursesModel({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.category,
    this.lescture,
    this.durationHours,
    this.price,
    this.reviews,
    this.rating,
    this.nameInstractor,
    this.bioInstractor,
    this.imageInstractor,
  });

  RecommendedCoursesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['image'];
    category = json['category'];
    lescture = json['lectures'];
    durationHours = json['duration_hours'];
    price = json['price'];
    reviews = json['reviews'];
    rating = json['rate'];
    nameInstractor = json['name'];
    bioInstractor = json['bio'];
    imageInstractor = json['photo'];
  }
}
