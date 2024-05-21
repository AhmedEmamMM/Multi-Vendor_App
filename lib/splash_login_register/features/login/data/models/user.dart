import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

enum UserType { admin, restaurant, client, driver }

class User {
  final String name;
  final String email;
  final String password;
  final UserType userType;

  User(this.name, this.email, this.password, this.userType);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'userType': userType,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['name'] as String,
      map['email'] as String,
      map['password'] as String,
      map['userType'] as UserType,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
