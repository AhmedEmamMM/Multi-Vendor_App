import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/repo/client_home_repo.dart';
import '../../data/models/restauran_model.dart';

part 'client_home_state.dart';

class ClientHomeCubit extends Cubit<ClientHomeState> {
  final ClientHomeRepo clientHomeRepo;
  ClientHomeCubit(this.clientHomeRepo) : super(ClientHomeInitial());

  void getAllRestaurants() async {
    emit(GetAllRestaurantsLoading());
    try {
      await clientHomeRepo
          .getAllRestaurants()
          .then((restaurants) => emit(GetAllRestaurantsSuccess(restaurants)));
    } catch (e) {
      emit(GetAllRestaurantsFaliuer(e.toString()));
    }
  }
}
