// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../client_cart/view/client_cart.dart';
import '../../client_favorites/view/client_favorite.dart';
import '../../client_home/view/client_home.dart';
import '../../client_profile/view/client_profile.dart';
import '../../client_search/view/client_search.dart';

part 'client_dash_board_state.dart';

class ClientDashBoardCubit extends Cubit<ClientDashBoardState> {
  ClientDashBoardCubit() : super(BottomNavIndexInitialState());

  // bottom navigation bar  icons list
  List<Widget> bottomNavIconsList = [
    const Icon(Icons.person, size: 30),
    const Icon(Icons.favorite, size: 30),
    const Icon(Icons.home, size: 30),
    const Badge(
      label: Text('0'),
      child: Icon(Icons.shopping_cart, size: 30),
    ),
    const Icon(Icons.search, size: 30),
  ];
  //bottom navigation bar pages index and list
  List<Widget> clientPagesList = [
    BlocProvider<ClientDashBoardCubit>(
      create: (context) => ClientDashBoardCubit(),
      child: const ClientProfile(),
    ),
    const ClientFavorite(),
    const ClientHome(),
    const ClientCart(),
    const ClientSearch(),
  ];

  void setNewPageIndex(int index) {
    emit(ChangeBottomNavIndex(index: index));
    debugPrint('index: $index');
  }
}
