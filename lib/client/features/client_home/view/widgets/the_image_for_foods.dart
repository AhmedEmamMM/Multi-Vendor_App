import 'package:flutter/material.dart';
import '../../data/models/food_model.dart';

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
