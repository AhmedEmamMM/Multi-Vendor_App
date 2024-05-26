import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwapBetweenLoginAndRegisterText extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const SwapBetweenLoginAndRegisterText({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
          text: TextSpan(
              text: text1,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
              ),
              children: [
            TextSpan(
              text: text2,
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 3.w,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ])),
    );
  }
}
