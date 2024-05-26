import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../../../auth_gate/imports/imports.dart';
import '../../../../auth_gate/data/models/user.dart';
import '../../client_home/view/client_home.dart';
import '../../client_profile/view/client_profile.dart';
import '../../client_search/view/client_search.dart';

class ClientDashBoard extends StatefulWidget {
  final UserData userData;
  const ClientDashBoard({super.key, required this.userData});

  @override
  State<ClientDashBoard> createState() => _ClientDashBoardState();
}

class _ClientDashBoardState extends State<ClientDashBoard> {
  int currentIndex = 1;

  List<Widget> bottomNavIconsList = [
    const Icon(Icons.person, size: 30),
    const Icon(Icons.home, size: 30),
    const Icon(Icons.search, size: 30),
  ];

//bottom navigation bar pages index and list
  List<Widget> clientPagesList(UserData userData) => [
        ClientProfile(userData: userData),
        const ClientHome(),
        const ClientSearch(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        backgroundColor: Colors.transparent,
        color: Colors.transparent,
        buttonBackgroundColor: Colors.white,
        items: bottomNavIconsList,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
      ),
      body: clientPagesList(widget.userData)[currentIndex],
    );
  }
}
