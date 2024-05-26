import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/restauran_model.dart';

class TheImageForRestaurants extends StatelessWidget {
  final Restaurant restaurant;
  const TheImageForRestaurants({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: double.infinity,
        height: 98,
        child: Image.network(
          restaurant.imageUrl.toString(),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
