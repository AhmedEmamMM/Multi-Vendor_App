import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/logic/client_cubit/client_cubit.dart';
import 'splash_login_register_sutibale_page_to_view/view/get_user_data_and_view_page_depend_on_user_type.dart';
import 'splash_login_register_sutibale_page_to_view/view/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthInstance = FirebaseAuth.instance;
    final clientCubit = ClientCubit();
    return Scaffold(
      body: StreamBuilder(
        stream: firebaseAuthInstance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return BlocProvider(
              create: (context) => clientCubit..getUserData(),
              child: const GetUserDataAndViewSutiblaAppDependOnUserType(),
            );
          }
          // user is not logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
