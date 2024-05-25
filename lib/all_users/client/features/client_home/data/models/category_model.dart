import 'food_model.dart';

class Category {
  String? categoryID;
  String? title;
  String? value;
  String? imageUrl;
  List<Food>? foods;

  Category(
      {this.categoryID, this.title, this.value, this.imageUrl, this.foods});

  Category.fromJson(Map<String, dynamic> json) {
    categoryID = json['_id'];
    title = json['title'];
    value = json['value'];
    imageUrl = json['imageUrl'];
    if (json['foods'] != null) {
      foods = <Food>[];
      json['foods'].forEach((v) {
        foods!.add(Food.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = categoryID;
    data['title'] = title;
    data['value'] = value;
    data['imageUrl'] = imageUrl;
    if (foods != null) {
      data['foods'] = foods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
