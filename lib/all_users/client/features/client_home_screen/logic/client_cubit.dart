// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register/data/models/user.dart';
import 'package:meta/meta.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit() : super(ClientInitial());
  final firebaseAuthInstance = FirebaseAuth.instance;

  void getUserData() async {
    emit(GetUserDataLoading());
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseAuthInstance.currentUser!.uid)
          .get()
          .then((userDataFromDB) {
        debugPrint(userDataFromDB.data().toString());
        emit(GetUserDataSuccess(UserData.fromJson(userDataFromDB.data()!)));
      });
    } catch (e) {
      emit(GetUserDataFaliuer(e.toString()));
    }
  }
}
