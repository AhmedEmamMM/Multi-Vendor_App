import 'package:flutter/material.dart';

import '../../../../../../global_core/constants/constants.dart';
import '../../../../../../global_core/constants/uidata.dart';
import '../../../../../../global_core/helpers/helpers.dart';

class NearbyRestaurantListView extends StatelessWidget {
  const NearbyRestaurantListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            restaurants.length,
            (index) => Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: widthOfTheScreen(context) * 0.75,
                  decoration: BoxDecoration(
                    color: kOffWhite,
                    border: Border.all(color: kGray, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          restaurants[index]['imageUrl'],
                          height: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              restaurants[index]['title'],
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Delivery time'),
                                Text(restaurants[index]['time'],
                                    style: const TextStyle(
                                        color: kPrimary,
                                        fontSize: 16)),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Rating :    '),
                                Text(
                                  ' +${restaurants[index]['ratingCount']}',
                                  style: const TextStyle(
                                      color: kPrimary, fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
