import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_dashboard/logic/client_dash_board_cubit.dart';
import 'widgets/dashboard_scaffold.dart';

class ClientDashBoard extends StatelessWidget {
  const ClientDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final dashBoardCubit = BlocProvider.of<ClientDashBoardCubit>(context);

    return BlocBuilder<ClientDashBoardCubit, ClientDashBoardState>(
      builder: (context, state) {
        if (state is ChangeBottomNavIndex) {
          return DashBoardScaffold(
            index: state.index,
            items: dashBoardCubit.bottomNavIconsList,
            onTap: (index) => dashBoardCubit.setNewPageIndex(index),
            body: dashBoardCubit.clientPagesList[state.index],
          );
        } else {
          return DashBoardScaffold(
            index: 2,
            items: dashBoardCubit.bottomNavIconsList,
            onTap: (index) => dashBoardCubit.setNewPageIndex(index),
            body: dashBoardCubit.clientPagesList[2],
          );
        }
      },
    );
  }
}
