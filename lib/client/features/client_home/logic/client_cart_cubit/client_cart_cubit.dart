import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/cart_item.dart';
import '../../data/models/additvies_model.dart';
import '../../data/models/food_model.dart';

part 'client_cart_state.dart';

class ClientCartCubit extends Cubit<ClientCartState> {
  ClientCartCubit() : super(const ClientCartState([]));

  void addItem(CartItem cartItem) {
    final updatedItems = List<CartItem>.from(state.items)..add(cartItem);
    emit(ClientCartState(updatedItems));
  }

  void addToCart(Food food, List<Additives> selectedAdditives) {
    // see if there is a cart item alreadyt with the same food and seletect addons
    CartItem? cartItem = state.items.firstWhereOrNull((item) {
      //cheak is the food items are the same
      bool isSameFood = item.food == food;

      //cheak is the List of Selected addons are the same
      bool isSameAddons = const ListEquality()
          .equals(item.selectedAdditives, selectedAdditives);

      return isSameFood && isSameAddons;
    });

    // if item alreafy exists , increase the quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // otherwise , add a new cart item to the cart
    else {
      final updatedItems = List<CartItem>.from(state.items)
        ..add(CartItem(food: food, selectedAdditives: selectedAdditives));
      emit(ClientCartState(updatedItems));
    }
  }
}
