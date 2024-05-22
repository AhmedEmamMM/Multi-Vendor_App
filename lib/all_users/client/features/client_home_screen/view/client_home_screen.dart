import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_home_screen/logic/client_cubit.dart';
import '../../../../../global_core/auth/auth_service.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) {
        if (state is GetUserDataLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.black));
        } else if (state is GetUserDataSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Welcome ${state.userData.name}'),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      if (FirebaseAuth.instance.currentUser != null) {
                        AuthService().signOut();
                      }
                    },
                    icon: const Icon(Icons.exit_to_app))
              ],
            ),
          );
        } else if (state is GetUserDataFaliuer) {
          return Center(child: Text('the error is ${state.message}'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
