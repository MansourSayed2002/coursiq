class MycourseModel {
  final int id;
  final String title;
  final num progress;
  final String description;
  final double price;
  final String imageUrl;
  final String instructorName;
  final String instructorPhotoUrl;

  MycourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.instructorName,
    required this.instructorPhotoUrl,
    required this.progress,
  });

  // لتحويل من JSON (مفيد لو بتجيب البيانات من API أو Supabase)
  factory MycourseModel.fromJson(Map<String, dynamic> json) {
    return MycourseModel(
      id: json['course_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image'] as String,
      instructorName: json['instructor_name'] as String,
      instructorPhotoUrl: json['instructor_photo'] as String,
      progress: json['progress'] as num,
    );
  }

  // لتحويل الكائن إلى JSON (لو هتحفظ أو ترسل بيانات)
  Map<String, dynamic> toJson() {
    return {
      'course_id': id,
      'title': title,
      'description': description,
      'price': price,
      'image': imageUrl,
      'instructor_name': instructorName,
      'instructor_photo': instructorPhotoUrl,
      'progress': progress,
    };
  }
}
