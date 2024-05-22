import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomContainer extends StatelessWidget {
  final Widget customContainerContent;
  const CustomContainer({super.key, required this.customContainerContent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          width: MediaQuery.of(context).size.width,
          color: kOffWhite,
          child: SingleChildScrollView(
            child: customContainerContent,
          ),
        ),
      ),
    );
  }
}
