import 'package:flutter/material.dart';
import '../../data/models/restauran_model.dart';

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
