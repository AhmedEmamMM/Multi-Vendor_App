import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var radius = 50.0.r;
    var controlPoint = Offset((size.width * 0.65).w, (size.height * 0.5).h);
    var controlPoint2 = Offset((size.width * 0.35).w, (size.height * 0.5).h);
    var endPoint = Offset((size.width * 0.25).w, (size.height - 30).h);
    Path path = Path()
      // p1 (0,0)  top left
      ..lineTo((size.width).w, 0) // p2
      ..lineTo((size.width).w, (size.height).h) // p3
      ..lineTo((size.width * 0.85).w, (size.height - 2).h) // p4
      ..arcToPoint(Offset((size.width * 0.75).w, (size.height - 30).h),
          radius: Radius.circular(radius), clockwise: true) //p5
      ..cubicTo(controlPoint.dx, controlPoint.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy) //p6
      ..arcToPoint(Offset((size.width* 0.15).w, (size.height - 2).h),
          radius: Radius.circular(radius)) //p7
      ..lineTo(0, (size.height).h) // p8
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
