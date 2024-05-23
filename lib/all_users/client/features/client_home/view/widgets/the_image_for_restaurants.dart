import 'package:flutter/material.dart';

class TheImageForRestaurants extends StatelessWidget {
  final dynamic restaurants;
  const TheImageForRestaurants({
    super.key,
    required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: double.infinity,
        height: 98,
        child: Image.network(
          restaurants['imageUrl'],
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
