part of 'client_home_cubit.dart';

@immutable
sealed class ClientHomeState {}

final class ClientHomeInitial extends ClientHomeState {}

// the 3 restaurants state
class GetAllRestaurantsAndCategoriesLoading extends ClientHomeState {}

class GetAllRestaurantsAndCategoriesSuccess extends ClientHomeState {
  final List<Restaurant> allRestaurants;
  final List<Category> allCategories;
  GetAllRestaurantsAndCategoriesSuccess(
    this.allRestaurants,
    this.allCategories,
  );
}

class GetAllRestaurantsAndCategoriesFaliuer extends ClientHomeState {
  final String theError;
  GetAllRestaurantsAndCategoriesFaliuer(this.theError);
}
