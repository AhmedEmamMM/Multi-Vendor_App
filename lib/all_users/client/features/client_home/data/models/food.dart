class Food {
  String? sId;
  String? title;
  List<String>? foodTags;
  List<String>? foodType;
  String? code;
  bool? isAvailable;
  String? restaurant;
  double? rating;
  String? ratingCount;
  String? description;
  double? price;
  List<Additives>? additives;
  String? imageUrl;
  int? iV;
  String? category;
  String? time;

  Food(
      {this.sId,
      this.title,
      this.foodTags,
      this.foodType,
      this.code,
      this.isAvailable,
      this.restaurant,
      this.rating,
      this.ratingCount,
      this.description,
      this.price,
      this.additives,
      this.imageUrl,
      this.iV,
      this.category,
      this.time});

  Food.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    foodTags = json['foodTags'].cast<String>();
    foodType = json['foodType'].cast<String>();
    code = json['code'];
    isAvailable = json['isAvailable'];
    restaurant = json['restaurant'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    description = json['description'];
    price = json['price'];
    if (json['additives'] != null) {
      additives = <Additives>[];
      json['additives'].forEach((v) {
        additives!.add(Additives.fromJson(v));
      });
    }
    imageUrl = json['imageUrl'];
    iV = json['__v'];
    category = json['category'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['foodTags'] = foodTags;
    data['foodType'] = foodType;
    data['code'] = code;
    data['isAvailable'] = isAvailable;
    data['restaurant'] = restaurant;
    data['rating'] = rating;
    data['ratingCount'] = ratingCount;
    data['description'] = description;
    data['price'] = price;
    if (additives != null) {
      data['additives'] = additives!.map((v) => v.toJson()).toList();
    }
    data['imageUrl'] = imageUrl;
    data['__v'] = iV;
    data['category'] = category;
    data['time'] = time;
    return data;
  }
}

class Additives {
  int? id;
  String? title;
  String? price;

  Additives({this.id, this.title, this.price});

  Additives.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    return data;
  }
}
