import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Heading extends StatelessWidget {
  final String text;
  const Heading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
