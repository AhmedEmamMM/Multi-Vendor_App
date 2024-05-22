part of 'client_cubit.dart';

@immutable
sealed class ClientState {}

final class ClientInitial extends ClientState {}

class GetUserDataLoading extends ClientState {}

class GetUserDataSuccess extends ClientState {
  final UserData userData;
  GetUserDataSuccess(this.userData);
}

class GetUserDataFaliuer extends ClientState {
  final String message;
  GetUserDataFaliuer(this.message);
}
