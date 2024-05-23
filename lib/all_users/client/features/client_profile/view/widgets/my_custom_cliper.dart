import 'package:flutter/material.dart';

class MyCustomCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var radius = 50.0;
    var controlPoint = Offset(size.width * 0.65, size.height * 0.5);
    var controlPoint2 = Offset(size.width * 0.35, size.height * 0.5);
    var endPoint = Offset(size.width * 0.25, size.height - 30);
    Path path = Path()
      // p1 (0,0)  top left
      ..lineTo(size.width, 0) // p2
      ..lineTo(size.width, size.height) // p3
      ..lineTo(size.width * 0.85, size.height - 2) // p4
      ..arcToPoint(Offset((size.width * 0.75), size.height - 30),
          radius: Radius.circular(radius), clockwise: true) //p5
      ..cubicTo(controlPoint.dx, controlPoint.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy) //p6
      ..arcToPoint(Offset(size.width * 0.15, size.height - 2),
          radius: Radius.circular(radius)) //p7
      ..lineTo(0, size.height) // p8
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
