part of 'client_home_cubit.dart';

@immutable
sealed class ClientHomeState {}

final class ClientHomeInitial extends ClientHomeState {}

class GetAllRestaurantsLoading extends ClientHomeState {}

class GetAllRestaurantsSuccess extends ClientHomeState {
  final List<Restaurant> allRestaurants;
  GetAllRestaurantsSuccess(this.allRestaurants);
}

class GetAllRestaurantsFaliuer extends ClientHomeState {
  final String theError;
  GetAllRestaurantsFaliuer(this.theError);
}
