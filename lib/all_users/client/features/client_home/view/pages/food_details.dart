import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_home/data/models/food.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/helpers/helpers.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/widgets/my_button.dart';

import 'widgets/custom_icon_button.dart';

class FoodDetails extends StatelessWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: heightOfTheScreen(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: heightOfTheScreen(context) * 0.6,
                    width: widthOfTheScreen(context),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(widthOfTheScreen(context) / 2),
                        bottomRight:
                            Radius.circular(widthOfTheScreen(context) / 2),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 45,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(food.imageUrl.toString()),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(150)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50.0, left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          iconData: Icons.arrow_back,
                          onTap: () => Navigator.pop(context),
                        ),
                        CustomIconButton(
                          iconData: Icons.favorite_outline,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 150,
                      child: Text(
                        '\$ ${food.price}',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.title.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                              child: Text(
                            '⭐ ${food.rating}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                        ),
                        25.horizontalSpace,
                        Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                              child: Text(
                            '+ 300   orderd ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    const Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      food.description.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    25.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(16)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.minimize),
                              Text(
                                '1',
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                        ),
                        MyButton(
                          minWidth: 200,
                          backGroudcolor: Colors.grey.shade300,
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
              150.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
