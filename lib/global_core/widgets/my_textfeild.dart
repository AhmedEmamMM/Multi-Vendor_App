import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? obscureText;
  const MyTextField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 53,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.white.withOpacity(0.4)),
      child: Center(
        child: TextFormField(
          obscureText: obscureText ?? false,
          textInputAction: textInputAction ?? TextInputAction.next,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.name,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: hintText,
            hintStyle: TextStyle(fontSize:18.sp, fontWeight: FontWeight.bold),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
