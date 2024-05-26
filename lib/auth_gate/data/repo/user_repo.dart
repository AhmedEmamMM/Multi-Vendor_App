import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';
import '../../imports/imports.dart';

class UserRepo {
  final firebaseAuthInstance = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future<UserData> getUserData() async {
    late UserData userData;
    try {
      await firestore
          .collection('Users')
          .doc(firebaseAuthInstance.currentUser!.uid)
          .get()
          .then((userDataFromDB) {
        userData = UserData.fromJson(userDataFromDB.data()!);
      });
      return userData;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
