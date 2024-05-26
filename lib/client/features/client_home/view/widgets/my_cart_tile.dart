import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/cart_item.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/view/widgets/quantity_selector.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/constants/constants.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: kOffWhite,
        border: Border.all(color: kGray, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
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
                const Spacer(),
                // name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //food name
                    Text(
                      cartItem.food.title!,
                      style: const TextStyle(
                        color: kGray,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // food price
                    Text(
                      "\$ ${cartItem.food.price}",
                      style: const TextStyle(
                        color: kGray,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    4.verticalSpace,
                    QuantitySelector(
                      quantity: cartItem.quantity,
                      food: cartItem.food,
                      onIncreimant: () {},
                      onDecrement: () {},
                    ),
                  ],
                ),
                const Spacer(),
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
                        color: const MaterialStatePropertyAll(kSecondary),
                        label: Row(
                          children: [
                            // additive name
                            Text(additive.title!),
                            10.horizontalSpace,
                            // additive price
                            Text(" ( \$ ${additive.price} )"),
                          ],
                        ),
                        shape: StadiumBorder(
                            side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        )),
                        onSelected: (value) {},
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
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
