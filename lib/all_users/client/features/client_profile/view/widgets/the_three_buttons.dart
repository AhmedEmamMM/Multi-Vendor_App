import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../global_core/widgets/my_button.dart';

class TheThreeButtons extends StatelessWidget {
  final void Function()? editOnTap;
  final void Function()? myFavoriteOnTap;
  final void Function()? exitOnTap;
  const TheThreeButtons({
    super.key,
    required this.editOnTap,
    required this.myFavoriteOnTap,
    required this.exitOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyButton(
              height: 42,
              backGroudcolor: Colors.blue.shade900,
              minWidth: 135,
              onPressed: editOnTap,
              child: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MyButton(
              height: 42,
              backGroudcolor: Colors.blue.shade900,
              minWidth: 135,
              onPressed: myFavoriteOnTap,
              child: const Text(
                'MyFavorite',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        5.verticalSpace,
        MyButton(
          height: 42,
          backGroudcolor: Colors.blue.shade900,
          minWidth: 135,
          onPressed: exitOnTap,
          child: const Text(
            'Exit',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
