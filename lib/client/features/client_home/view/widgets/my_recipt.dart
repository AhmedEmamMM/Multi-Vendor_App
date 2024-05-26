import 'package:flutter/material.dart';
import '../../../../../global_core/helpers/helpers.dart';
import '../../../../../global_core/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Thank you for your order!"),
            25.verticalSpace,
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(25),
                child: Consumer<CartProvider>(
                  builder: (context, cartProvider, child) =>
                      Text(cartProvider.displayCartReceipt()),
                ),
                ),
            25.verticalSpace,
            const Text("Estimated delivery time is : 4:10 PM"),
          ],
        ),
      ),
    );
  }
}
