import 'package:four_apps_in_one_multi_user_app/global_core/constants/my_resutants_data.dart';

import '../models/restauran_model.dart';

class ClientHomeRepo {
  late final List<Restaurant> allRestaurants;

  Future<List<Restaurant>> getAllRestaurants() async {
    return allRestaurants = myRestaurants
        .map((restaurant) => Restaurant.fromJson(restaurant))
        .toList();
  }
}
