part of 'auth_gate_cubit.dart';

@immutable
sealed class AuthGateState {}

final class AuthGateInitial extends AuthGateState {}

class GetUserDataLoadingState extends AuthGateState {}

class GetUserDataSuccessState extends AuthGateState {
  final UserData userData;
  GetUserDataSuccessState(this.userData);
}

class GetUserDataFaliuerState extends AuthGateState {
  final String message;
  GetUserDataFaliuerState(this.message);
}
