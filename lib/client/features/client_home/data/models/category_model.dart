class Category {
  String? categoryID;
  String? name;
  String? imageUrl;

  Category({this.categoryID, this.name, this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    categoryID = json['categoryID'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryID'] = categoryID;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
