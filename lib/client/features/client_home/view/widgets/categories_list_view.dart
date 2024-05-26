import 'package:flutter/material.dart';

import '../../../../../global_core/constants/constants.dart';
import '../../../../../global_core/constants/uidata.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          categories.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            height: 80,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: kGray, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  categories[index]["imageUrl"],
                  height: 40,
                ),
                Text(categories[index]["title"])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
