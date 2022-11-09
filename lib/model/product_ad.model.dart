class ProductAd {
  String? title;
  String? price;
  String? photo;
  String? contact;
  String? description;

  ProductAd(
      {this.title, this.price, this.photo, this.contact, this.description});

  ProductAd.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    photo = json['photo'];
    contact = json['contact'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['photo'] = this.photo;
    data['contact'] = this.contact;
    data['description'] = this.description;
    return data;
  }
}