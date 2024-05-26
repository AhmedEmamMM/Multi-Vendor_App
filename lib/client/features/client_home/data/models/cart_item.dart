import 'additvies_model.dart';
import 'food_model.dart';

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
