import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserData {
  String? uid;
  String? name;
  String? email;
  String? password;
  String? userType;

  UserData(this.uid, this.name, this.email, this.password, this.userType);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'userType': userType,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      map['uid'] as String,
      map['name'] as String,
      map['email'] as String,
      map['password'] as String,
      map['userType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      json['uid'],
      json['name'],
      json['email'],
      json['password'],
      json['userType'],
    );
  }
}
