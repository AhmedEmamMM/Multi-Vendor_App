import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/additvies_model.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/cart_item.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/food_model.dart';
import 'package:intl/intl.dart';

class CartProvider extends ChangeNotifier {
  //user cart
  final List<CartItem> _cart = [];

  // delivery address (which user can maually change/update)
  String _deliveryAddress = "Mokkatem/Asmarat";

  /*

    G E T T E R S

  */
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*

    O P E R A T I O N S

  */

  // add to the cart
  void addToCart(Food food, List<Additives> selectedAdditives) {
    // see if there is a cart item alreadyt with the same food and seletect addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
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
      _cart.add(CartItem(food: food, selectedAdditives: selectedAdditives));
    }
    notifyListeners();
  }

  // remove from a cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // total price of the cart
  double getTotalePrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double? itemTotal = cartItem.food.price;

      for (Additives additives in cartItem.selectedAdditives) {
        itemTotal = (itemTotal! + double.parse(additives.price!));
      }
      total += (itemTotal! * cartItem.quantity);
    }
    return total;
  }

  // get total number of items in cat
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*

    H E L P E R S

  */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.title} - ${_formatPrice(cartItem.food.price!)}");
      if (cartItem.selectedAdditives.isNotEmpty) {
        receipt.writeln(
            "   Add-ons: ${_formatAddons(cartItem.selectedAdditives)}");
      }
      receipt.writeln();
    }
    receipt.writeln("-----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalePrice())}");
    receipt.writeln();
    receipt.writeln("Delivery to: $deliveryAddress");

    return receipt.toString();
  }

  //format aouble calue into money
  String _formatPrice(double price) {
    return "\$ ${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Additives> additives) {
    return additives
        .map((additive) =>
            "${additive.title} (${_formatPrice(double.parse(additive.price!))})")
        .join(", ");
  }
}
