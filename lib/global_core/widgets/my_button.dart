import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? backGroudcolor;
  final TextStyle? textStyle;
  final double? verticalPadding;
  final double? circularBorderRadius;
  final double? minWidth;
  final double? height;
  const MyButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.backGroudcolor,
    this.textStyle,
    this.verticalPadding,
    this.circularBorderRadius,
    this.minWidth,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? 55.0,
      minWidth: minWidth ?? MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 8),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius ?? 16)),
      color: backGroudcolor ?? Colors.amber,
      child: child,
    );
  }
}
