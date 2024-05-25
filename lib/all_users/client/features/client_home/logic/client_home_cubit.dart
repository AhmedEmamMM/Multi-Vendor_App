import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_home/data/repo/client_home_repo.dart';
import '../data/models/restauran_model.dart';

part 'client_home_state.dart';

class ClientHomeCubit extends Cubit<ClientHomeState> {
  final ClientHomeRepo clientHomeRepo;
  ClientHomeCubit(this.clientHomeRepo) : super(ClientHomeInitial());

  void getAllRestaurants() async {
    emit(GetAllRestaurantsLoading());
    try {
      List<Restaurant> allRestaurants =
          await clientHomeRepo.getAllRestaurants();
      debugPrint('allRestaurants: $allRestaurants');
      emit(GetAllRestaurantsSuccess(allRestaurants));
    } catch (e) {
      emit(GetAllRestaurantsFaliuer(e.toString()));
    }
  }
}
