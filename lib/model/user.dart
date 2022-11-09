class User {
  String? name;
  String? mail;
  String? phone;
  String? password;

  User({this.name, this.mail, this.phone, this.password});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mail = json['mail'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mail'] = this.mail;
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}