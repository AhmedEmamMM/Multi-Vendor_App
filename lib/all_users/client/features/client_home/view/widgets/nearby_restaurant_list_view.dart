import 'package:flutter/material.dart';

import '../../../../../../global_core/constants/constants.dart';
import '../../../../../../global_core/constants/uidata.dart';
import '../../../../../../global_core/helpers/helpers.dart';
import 'the_image_for_restaurants.dart';

class NearbyRestaurantListView extends StatelessWidget {
  const NearbyRestaurantListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants.length, (index) {
          // get individual restaurant
          final restaurant = restaurants[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: widthOfTheScreen(context) * 0.75,
              decoration: BoxDecoration(
                color: kOffWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  TheImageForRestaurants(restaurants: restaurant),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant['title'],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Delivery time'),
                          Text(restaurant['time'],
                              style: const TextStyle(
                                  color: kPrimary, fontSize: 16)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Rating :    '),
                          Text(
                            ' +${restaurant['ratingCount']}',
                            style:
                                const TextStyle(color: kPrimary, fontSize: 18),
                          ),
                          const Icon(Icons.favorite_outline, size: 20),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
