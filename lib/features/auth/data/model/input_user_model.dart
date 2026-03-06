class InputUserModel {
  String? id;
  String? email;
  String? fullName;
  InputUserModel({this.email, this.fullName, this.id});

  // InputUserModel.fromJson(Map<String, dynamic> json) {
  //   email = json['email'];
  //   password = json['password'];
  //   fullName = json['fullname'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['id'] = id;
    data['fullname'] = fullName;
    return data;
  }
}
