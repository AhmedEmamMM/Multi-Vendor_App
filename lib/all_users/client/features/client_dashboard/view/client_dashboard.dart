import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_dashboard/logic/client_dash_board_cubit.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_search/view/client_search.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/data/models/user.dart';

import '../../client_home/view/client_home.dart';
import '../../client_profile/view/client_profile.dart';

class ClientDashBoard extends StatefulWidget {
  final UserData userData;
  const ClientDashBoard({super.key, required this.userData});

  @override
  State<ClientDashBoard> createState() => _ClientDashBoardState();
}

class _ClientDashBoardState extends State<ClientDashBoard> {
  int pagesIndex = 1;

  @override
  Widget build(BuildContext context) {
    final dashBoardCubit = BlocProvider.of<ClientDashBoardCubit>(context);
    List<Widget> clientPagesList = [
      ClientSearch(userData: widget.userData),
      ClientHome(userData: widget.userData),
      ClientProfile(userData: widget.userData),
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
