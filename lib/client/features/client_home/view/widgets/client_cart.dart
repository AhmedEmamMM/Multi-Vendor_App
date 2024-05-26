import 'package:four_apps_in_one_multi_user_app/client/features/client_home/view/widgets/clear_the_cart.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/view/widgets/my_cart_tile.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/helpers/helpers.dart';
import 'package:four_apps_in_one_multi_user_app/auth_gate/imports/imports.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ClientCart extends StatelessWidget {
  const ClientCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        //cart
        final userCart = cartProvider.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            actions: [
              ClearTheCart(
                yesButtonOnPressed: () {
                  Navigator.pop(context);
                  cartProvider.clearCart();
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35),
            child: Column(
              children: [
                userCart.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            "Cart is empty",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..shader = const LinearGradient(
                                  colors: [
                                    Colors.red,
                                    Colors.blue,
                                  ],
                                ).createShader(
                                  const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                                ),
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              //get individual cart item
                              final cartItem = userCart[index];
                              // return cart tile ui
                              return MyCartTile(cartItem: cartItem);
                            }),
                      ),
                20.verticalSpace,
                userCart.isEmpty
                    ? const Text("")
                    : MyButton(
                        onPressed: () {},
                        // => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const CheckOutPage(),
                        //   ),
                        // ),
                        backGroudcolor: Colors.white.withOpacity(0.8),
                        child: const Text("Go to Cheackout"),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
