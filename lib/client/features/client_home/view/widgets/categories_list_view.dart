import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/category_model.dart';
import '../../../../../global_core/constants/constants.dart';

class CategoriesListView extends StatelessWidget {
  final List<Category> allCategories;
  const CategoriesListView({super.key, required this.allCategories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(allCategories.length, (index) {
          // get individual Category
          Category category = allCategories[index];
          return Container(
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
                Image.network(category.imageUrl!, height: 40),
                Text(category.name!),
              ],
            ),
          );
        }),
      ),
    );
  }
}
