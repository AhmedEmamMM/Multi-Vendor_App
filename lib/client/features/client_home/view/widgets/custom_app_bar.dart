import 'package:flutter/material.dart';
import '../../../../../global_core/constants/constants.dart';
import '../../../../../global_core/helpers/helpers.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final int cartItemsCount;
  final String address;
  const CustomAppBar(
      {super.key,
      this.onPressed,
      required this.address,
      required this.cartItemsCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      height: 55,
      width: widthOfTheScreen(context),
      child: Row(
        children: [
          const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/imgs/splash_screen.jpg')),
          15.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Deliver to',
                  style: TextStyle(
                      color: kOffWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(address,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: onPressed,
              icon: Badge(
                label: Text('$cartItemsCount'),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 35,
                  color: kDark,
                ),
              )),
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
