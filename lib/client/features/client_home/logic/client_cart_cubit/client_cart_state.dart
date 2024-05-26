part of 'client_cart_cubit.dart';

class ClientCartState extends Equatable {
  final List<CartItem> items;
  const ClientCartState(this.items);

  @override
  List<Object> get props => [items];
}
