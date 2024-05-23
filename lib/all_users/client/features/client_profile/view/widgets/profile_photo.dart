import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/constants/constants.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 118,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              border: Border.all(color: kGray, width: 1.5),
              borderRadius: BorderRadius.circular(75)),
          child: const CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage('assets/imgs/a_background.jpg'),
          ),
        ));
  }
}
