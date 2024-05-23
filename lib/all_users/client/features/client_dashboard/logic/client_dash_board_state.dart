part of 'client_dash_board_cubit.dart';

@immutable
sealed class ClientDashBoardState {}

final class ClientDashBoardInitial extends ClientDashBoardState {}

class ChangeBottomNavIndex extends ClientDashBoardState {
  final int index;
  ChangeBottomNavIndex({this.index = 2});
}
