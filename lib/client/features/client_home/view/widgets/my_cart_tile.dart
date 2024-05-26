import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/cart_item.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/view/widgets/quantity_selector.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    cartItem.food.imageUrl.toString(),
                    height: 100,
                    width: 140,
                  ),
                ),
                10.horizontalSpace,

                // name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //food name
                    Text(cartItem.food.title!),

                    // food price
                    Text(
                      "\$ ${cartItem.food.price}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // incremant or decrment
                QuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onIncreimant: () {},
                    onDecrement: () {}),
              ],
            ),
          ),

          // addons
          SizedBox(
            height: cartItem.selectedAdditives.isEmpty ? 0 : 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              children: cartItem.selectedAdditives
                  .map(
                    (additive) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        label: Row(
                          children: [
                            // addon name
                            Text(additive.title!),
                            10.horizontalSpace,

                            // addon price
                            Text(" ( \$ ${additive.price} )"),
                          ],
                        ),
                        shape: StadiumBorder(
                            side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        )),
                        onSelected: (value) {},
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
