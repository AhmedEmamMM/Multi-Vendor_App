import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_home/data/models/food_model.dart';

class TheImageForFoods extends StatelessWidget {
  final Food food;
  const TheImageForFoods({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: double.infinity,
        height: 98,
        child: Image.network(
          food.imageUrl.toString(),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
