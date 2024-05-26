class Coords {
  String? coordsID;
  double? latitude;
  double? longitude;
  String? address;
  String? title;
  double? latitudeDelta;
  double? longitudeDelta;

  Coords({
    this.coordsID,
    this.latitude,
    this.longitude,
    this.address,
    this.title,
    this.latitudeDelta,
    this.longitudeDelta,
  });

  Coords.fromJson(Map<String, dynamic> json) {
    coordsID = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    title = json['title'];
    latitudeDelta = json['latitudeDelta'];
    longitudeDelta = json['longitudeDelta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = coordsID;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['title'] = title;
    data['latitudeDelta'] = latitudeDelta;
    data['longitudeDelta'] = longitudeDelta;
    return data;
  }
}
