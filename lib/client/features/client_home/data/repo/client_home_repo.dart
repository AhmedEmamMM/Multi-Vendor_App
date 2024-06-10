import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/category_model.dart';

import '../../../../../global_core/constants/my_resutants_data.dart';

import '../models/restauran_model.dart';

class ClientHomeRepo {
  final firestore = FirebaseFirestore.instance;

  Future<List<Restaurant>> getAllRestaurants() async {
    return myRestaurants
        .map((restaurant) => Restaurant.fromJson(restaurant))
        .toList();
  }

  Future<List<Category>> getAllCategories() async {
    var categories = await firestore.collection('Categories').get();
    return categories.docs.map((doc) => Category.fromJson(doc.data())).toList();
  }
}
