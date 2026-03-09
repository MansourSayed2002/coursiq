class InputSubscription {
  String? uuid;
  int? idCourse;

  InputSubscription({this.idCourse, this.uuid});

  Map<String, dynamic> toJson() {
    return {"user": uuid, "course": idCourse};
  }
}
