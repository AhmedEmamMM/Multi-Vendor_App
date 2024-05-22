import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  const MyText(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.size,
    this.fontWeight,
    this.maxLines,
    this.textDirection,
    this.overflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: style ??
          TextStyle(
            color: color ?? Colors.black,
            fontSize: size ?? 14,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      textDirection: textDirection ?? TextDirection.ltr,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}
