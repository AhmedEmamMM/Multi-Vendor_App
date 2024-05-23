import 'package:flutter/material.dart';

class AppBarTextField extends StatelessWidget {
  final TextEditingController? controller;
  const AppBarTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Search for',
        hintStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
