import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomContainer extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget customContainerContent;
  final bool isThereAppBar;
  const CustomContainer({
    super.key,
    required this.customContainerContent,
    required this.isThereAppBar,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isThereAppBar
          ? MediaQuery.of(context).size.height * 0.77
          : MediaQuery.of(context).size.height * 0.84,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Container(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
