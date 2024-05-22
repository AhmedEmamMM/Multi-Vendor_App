import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_home_screen/logic/client_cubit.dart';
import 'all_users/client/features/client_home_screen/view/client_home_screen.dart';
import 'splash_login_register/view/login_or_register.dart';

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
              child: const ClientHomeScreen(),
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
