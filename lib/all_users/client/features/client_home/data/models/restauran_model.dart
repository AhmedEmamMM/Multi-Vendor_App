import 'category_model.dart';
import 'coords_model.dart';

class Restaurant {
  String? restaurantID;
  String? title;
  String? time;
  String? imageUrl;
  String? owner;
  String? code;
  String? logoUrl;
  int? rating;
  String? ratingCount;
  Coords? coords;
  List<Category>? categories;

  Restaurant({
    this.restaurantID,
    this.title,
    this.time,
    this.imageUrl,
    this.owner,
    this.code,
    this.logoUrl,
    this.rating,
    this.ratingCount,
    this.coords,
    this.categories,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    restaurantID = json['_id'];
    title = json['title'];
    time = json['time'];
    imageUrl = json['imageUrl'];
    owner = json['owner'];
    code = json['code'];
    logoUrl = json['logoUrl'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    coords = json['coords'] != null ? Coords.fromJson(json['coords']) : null;
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = restaurantID;
    data['title'] = title;
    data['time'] = time;
    data['imageUrl'] = imageUrl;
    data['owner'] = owner;
    data['code'] = code;
    data['logoUrl'] = logoUrl;
    data['rating'] = rating;
    data['ratingCount'] = ratingCount;
    if (coords != null) {
      data['coords'] = coords!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
