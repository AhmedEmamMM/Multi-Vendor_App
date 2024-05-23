import 'package:flutter/material.dart';

import '../../../../../../global_core/helpers/helpers.dart';
import 'my_custom_cliper.dart';

class CoverPhoto extends StatelessWidget {
  const CoverPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: widthOfTheScreen(context),
      child: ClipPath(
        clipper: MyCustomCliper(),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/register_backgroud.jpg'),
                fit: BoxFit.cover),
          ),
          child: const Center(child: Text("MessageClipper()")),
        ),
      ),
    );
  }
}
