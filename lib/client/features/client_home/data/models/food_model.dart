import 'additvies_model.dart';

class Food {
  String? foodID;
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
  String? imageUrl;
  int? iV;
  String? categoryID;
  String? time;
  List<Additives>? additives;

  Food(
      {this.foodID,
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
      this.imageUrl,
      this.iV,
      this.categoryID,
      this.time,
      this.additives});

  Food.fromJson(Map<String, dynamic> json) {
    foodID = json['_id'];
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
    imageUrl = json['imageUrl'];
    iV = json['__v'];
    categoryID = json['categoryID'];
    time = json['time'];
    if (json['additives'] != null) {
      additives = <Additives>[];
      json['additives'].forEach((v) {
        additives!.add(Additives.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = foodID;
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
    data['imageUrl'] = imageUrl;
    data['__v'] = iV;
    data['categoryID'] = categoryID;
    data['time'] = time;
    if (additives != null) {
      data['additives'] = additives!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
