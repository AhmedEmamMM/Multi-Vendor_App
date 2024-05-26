import 'package:flutter/material.dart';
import 'my_custom_cliper.dart';

class CoverPhoto extends StatelessWidget {
  const CoverPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.31,
      width: size.width,
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
