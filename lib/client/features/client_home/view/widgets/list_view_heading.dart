import 'package:flutter/material.dart';
import '../../../../../global_core/constants/constants.dart';

class ListViewHeading extends StatelessWidget {
  final String text;

  const ListViewHeading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [
                  Colors.red,
                  Colors.blue,
                ],
              ).createShader(
                const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
              ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 30,
            color: kSecondary,
          ),
        )
      ],
    );
  }
}
