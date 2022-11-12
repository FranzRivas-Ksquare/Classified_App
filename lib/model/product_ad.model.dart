class ProductAd {
  String? sId;
  String? title;
  String? description;
  int? price;
  List<String>? images;
  String? authorName;
  String? userId;
  String? mobile;
  String? createdAt;
  int? iV;

  ProductAd(
      {this.sId,
        this.title,
        this.description,
        this.price,
        this.images,
        this.authorName,
        this.userId,
        this.mobile,
        this.createdAt,
        this.iV});

  ProductAd.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    images = json["images"] == null? [] : List<String>.from(json["images"].map((x) => x));
    authorName = json['authorName'];
    userId = json['userId'];
    mobile = json['mobile'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['images'] = images;
    data['authorName'] = authorName;
    data['userId'] = userId;
    data['mobile'] = mobile;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}