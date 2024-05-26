import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/additvies_model.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/food_model.dart';

class CartItem {
  Food food;
  List<Additives> selectedAdditives;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAdditives,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice = selectedAdditives.fold(
        0, (sum, additives) => sum + int.parse(additives.price.toString()));
    return (food.price! + addonsPrice) * quantity;
  }
}
