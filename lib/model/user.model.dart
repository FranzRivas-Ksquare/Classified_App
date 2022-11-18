class User {
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? image;

  User({this.name, this.email, this.mobile, this.password, this.image});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    password = json['password'] ?? '';
    mobile = json['mobile'] ?? '';
    image = json['imgURL'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['password'] = password;
    data['imgURL'] = image;
    return data;
  }
}