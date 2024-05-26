import 'package:flutter/material.dart';
import '../../data/models/food_model.dart';
import '../../../../../global_core/constants/constants.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncreimant;
  final VoidCallback onDecrement;
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onIncreimant,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSecondary,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          // decrease button
          GestureDetector(
            onTap: onDecrement,
            child: const Icon(Icons.remove, size: 20, color: Colors.black),
          ),

          // quantity count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
                child: Text(
              quantity.toString(),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),

          // increase button
          GestureDetector(
            onTap: onIncreimant,
            child: const Icon(Icons.add, size: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
