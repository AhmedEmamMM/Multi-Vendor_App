part of 'client_dash_board_cubit.dart';

@immutable
sealed class ClientDashBoardState {}

class ChangeBottomNavIndex extends ClientDashBoardState {
  final int index;
  ChangeBottomNavIndex({required this.index});
}

class BottomNavIndexInitialState extends ChangeBottomNavIndex {
  BottomNavIndexInitialState({super.index = 2});
}
