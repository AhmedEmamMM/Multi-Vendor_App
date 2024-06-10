import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/additvies_model.dart';

class Food {
  String? foodID;
  String? restaurantCode;
  String? categoryID;
  String? name;
  String? description;
  double? price;
  bool? isAvailable;
  double? rating;
  String? ratingCount;
  String? imageUrl;
  List<String>? foodType;
  List<String>? foodTags;
  List<Additives>? additives;

  Food(
      {this.foodID,
      this.restaurantCode,
      this.categoryID,
      this.name,
      this.foodTags,
      this.foodType,
      this.isAvailable,
      this.rating,
      this.ratingCount,
      this.description,
      this.price,
      this.imageUrl,
      this.additives});

  Food.fromJson(Map<String, dynamic> json) {
    foodID = json['foodID'];
    restaurantCode = json['restaurantCode'];
    categoryID = json['categoryID'];
    name = json['name'];
    foodTags = json['foodTags'].cast<String>();
    foodType = json['foodType'].cast<String>();
    isAvailable = json['isAvailable'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    if (json['additives'] != null) {
      additives = <Additives>[];
      json['additives'].forEach((v) {
        additives!.add(Additives.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodID'] = foodID;
    data['restaurantCode'] = restaurantCode;
    data['categoryID'] = categoryID;
    data['name'] = name;
    data['foodTags'] = foodTags;
    data['foodType'] = foodType;
    data['isAvailable'] = isAvailable;
    data['rating'] = rating;
    data['ratingCount'] = ratingCount;
    data['description'] = description;
    data['price'] = price;
    data['imageUrl'] = imageUrl;
    if (additives != null) {
      data['additives'] = additives!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
