import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_dashboard/logic/client_dash_board_cubit.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_profile/view/client_profile.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_search/view/client_search.dart';
import '../../client_home/view/client_home.dart';

class ClientDashBoard extends StatefulWidget {
  const ClientDashBoard({
    super.key,
  });

  @override
  State<ClientDashBoard> createState() => _ClientDashBoardState();
}

class _ClientDashBoardState extends State<ClientDashBoard> {
  int pagesIndex = 1;

  @override
  Widget build(BuildContext context) {
    final dashBoardCubit = BlocProvider.of<ClientDashBoardCubit>(context);
    final clientDashBoardCubit = ClientDashBoardCubit();

    List<Widget> clientPagesList = [
      BlocProvider<ClientDashBoardCubit>(
          create: (context) => clientDashBoardCubit,
          child: const ClientProfile()),
      const ClientHome(),
      const ClientSearch(),
    ];

    return BlocBuilder<ClientDashBoardCubit, ClientDashBoardState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            index: pagesIndex,
            backgroundColor: Colors.transparent,
            color: Colors.transparent,
            buttonBackgroundColor: Colors.white,
            items: dashBoardCubit.bottomNavIconsList,
            onTap: (index) {
              debugPrint('index: $index');
              setState(() {
                pagesIndex = index;
              });
            },
          ),
          body: clientPagesList[pagesIndex],
        );
      },
    );
  }
}
