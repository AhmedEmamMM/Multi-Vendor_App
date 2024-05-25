import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/models/user.dart';

part 'auth_gate_state.dart';

class AuthGateCubit extends Cubit<AuthGateState> {
  AuthGateCubit() : super(AuthGateInitial());

  final firebaseAuthInstance = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  void getUserData() async {
    emit(GetUserDataLoadingState());
    try {
      await firestore
          .collection('Users')
          .doc(firebaseAuthInstance.currentUser!.uid)
          .get()
          .then((userDataFromDB) {
        emit(
            GetUserDataSuccessState(UserData.fromJson(userDataFromDB.data()!)));
      });
    } catch (e) {
      emit(GetUserDataFaliuerState(e.toString()));
    }
  }
}
