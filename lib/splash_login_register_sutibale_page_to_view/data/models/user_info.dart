import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfo {
  String uid;
  String username;
  String email;
  String password;
  String profileImg;
  List followers;
  List following;

  UserInfo({
    required this.uid,
    required this.username,
    required this.email,
    required this.password,
    required this.profileImg,
    required this.followers,
    required this.following,
  });

// To convert the UserData(Data type) to   Map<String, Object>
  Map<String, dynamic> convert2Map() {
    return {
      "uid": uid,
      "username": username,
      "email": email,
      "password": password,
      "profileImg": profileImg,
      "followers": [],
      "following": [],
    };
  }

  // function that convert "DocumentSnapshot" to a User
// function that takes "DocumentSnapshot" and return a User

  static convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserInfo(
      uid: snapshot["uid"],
      username: snapshot["username"],
      email: snapshot["email"],
      password: snapshot["password"],
      profileImg: snapshot["profileImg"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }
}
