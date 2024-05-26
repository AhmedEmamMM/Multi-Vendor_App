import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance or auth
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? getCurrentuser() {
    return auth.currentUser;
  }

  // user sign in
  void signInWithEmailPassword({required String email, password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      // save user info if it dosent already exsit
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up
  void signUpWithEmailPassword(String name, email, password) async {
    try {
      // create user
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // save user info in a separate doc
      firestore.collection("Users").doc(auth.currentUser!.uid).set(
        {
          "uid": auth.currentUser!.uid,
          "name": name,
          "email": email,
          "password": password,
          "userType": "client",
        },
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async {
    return await auth.signOut();
  }

  Future<bool> isLoggedIn() async {
    var user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  // errors
}
