class Additives {
  int? additivesID;
  String? title;
  String? price;

  Additives({this.additivesID, this.title, this.price});

  Additives.fromJson(Map<String, dynamic> json) {
    additivesID = json['additivesID'];
    title = json['title'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['additivesID'] = additivesID;
    data['title'] = title;
    data['price'] = price;
    return data;
  }
}
