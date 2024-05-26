import 'package:flutter/material.dart';
import '../../../../../global_core/constants/constants.dart';

class RowOfFoodDetails extends StatelessWidget {
  final String leftText;
  final String rightText;
  const RowOfFoodDetails({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          rightText,
          style: const TextStyle(color: kPrimary, fontSize: 17),
        ),
      ],
    );
  }
}
