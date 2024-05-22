import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_dashboard/logic/client_dash_board_cubit.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_dashboard/view/client_dashboard.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/logic/client_cubit/client_cubit.dart';

class GetUserDataAndViewSutiblaAppDependOnUserType extends StatelessWidget {
  const GetUserDataAndViewSutiblaAppDependOnUserType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final clientDashBoardCubit = ClientDashBoardCubit();
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) {
        if (state is GetUserDataLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.black));
        } else if (state is GetUserDataSuccess) {
          if (state.userData.userType == "client") {
            return BlocProvider<ClientDashBoardCubit>(
              create: (context) => clientDashBoardCubit,
              child: ClientDashBoard(userData: state.userData),
            );
          } else {
            return const Center(child: Text('Unknown'));
          }
        } else if (state is GetUserDataFaliuer) {
          return Center(child: Text('the error is ${state.message}'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
