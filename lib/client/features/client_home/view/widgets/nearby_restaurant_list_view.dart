import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/view/widgets/restaurant_details.dart';

import '../../../../../global_core/constants/constants.dart';
import '../../../../../global_core/helpers/helpers.dart';
import '../../data/models/restauran_model.dart';
import 'the_image_for_restaurants.dart';

class NearbyRestaurantListView extends StatelessWidget {
  final List<Restaurant> allRestaurants;
  const NearbyRestaurantListView({
    super.key,
    required this.allRestaurants,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(allRestaurants.length, (index) {
          // get individual restaurant
          final restaurant = allRestaurants[index];
          return GestureDetector(
            onTap: () =>
                context.navigateTo(RestaurantDetails(restaurant: restaurant)),
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
                    TheImageForRestaurants(restaurant: restaurant),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.title.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Delivery time'),
                            Text(restaurant.time.toString(),
                                style: const TextStyle(
                                    color: kPrimary, fontSize: 16)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Rating :    '),
                            Text(
                              ' +${restaurant.ratingCount}',
                              style: const TextStyle(
                                  color: kPrimary, fontSize: 18),
                            ),
                            const Icon(Icons.favorite_outline, size: 20),
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
