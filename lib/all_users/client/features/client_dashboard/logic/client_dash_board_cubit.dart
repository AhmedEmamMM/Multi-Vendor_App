import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'client_dash_board_state.dart';

class ClientDashBoardCubit extends Cubit<ClientDashBoardState> {
  ClientDashBoardCubit() : super(ClientDashBoardInitial());

  List<Widget> bottomNavIconsList = [
    const Icon(Icons.person, size: 30),
    const Icon(Icons.home, size: 30),
    const Icon(Icons.search, size: 30),
  ];
}
