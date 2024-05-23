import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_home/data/models/food.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_home/view/pages/food_details.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_home/view/widgets/the_image_for_foods.dart';
import '../../../../../../global_core/constants/constants.dart';
import '../../../../../../global_core/constants/uidata.dart';
import '../../../../../../global_core/helpers/helpers.dart';

class HotFoodsListView extends StatelessWidget {
  const HotFoodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(foods.length, (index) {
          // get individual restaurant
          Food food = Food.fromJson(foods[index]);
          return GestureDetector(
            onTap: () => context.navigateTo(FoodDetails(food: food)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: widthOfTheScreen(context) * 0.75,
                decoration: BoxDecoration(
                  color: kOffWhite,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    TheImageForFoods(food: food),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              food.title.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('\$ ${food.price}',
                                style: const TextStyle(
                                    color: kPrimary, fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Delivery time : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              food.time.toString(),
                              style: const TextStyle(
                                color: kGray,
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                const Text(
                                  '  Rating : ',
                                  style: TextStyle(
                                    color: kPrimary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  ' +${food.ratingCount}',
                                  style: const TextStyle(
                                      color: kPrimary, fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
