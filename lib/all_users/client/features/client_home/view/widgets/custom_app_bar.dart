import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/constants/constants.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/helpers/helpers.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: widthOfTheScreen(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/imgs/splash_screen.jpg')),
          15.horizontalSpace,
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Deliver to',
                  style: TextStyle(
                      color: kSecondary,
                      fontSize: 19,
                      fontWeight: FontWeight.bold)),
              Text('Egypt/Cario/Mokattem/Asmarat',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
          15.horizontalSpace,
          Text(getIconForTimeOfDay(), style: const TextStyle(fontSize: 35))
        ],
      ),
    );
  }
}

String getIconForTimeOfDay() {
  DateTime now = DateTime.now();
  int hour = now.hour;
  if (hour >= 0 && hour <= 12) {
    return ' ☀️ ';
  } else if (hour > 12 && hour <= 16) {
    return ' ⛅ ';
  } else {
    return ' 🌙 ';
  }
}
