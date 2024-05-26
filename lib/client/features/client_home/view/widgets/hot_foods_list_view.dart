import 'package:four_apps_in_one_multi_user_app/client/features/client_home/logic/client_cart_cubit/client_cart_cubit.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/food_model.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/view/food_details.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/view/widgets/food_details_row_under_photo.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/view/widgets/the_image_for_foods.dart';
import 'package:four_apps_in_one_multi_user_app/auth_gate/imports/imports.dart';
import '../../../../../global_core/constants/constants.dart';
import '../../../../../global_core/constants/uidata.dart';
import '../../../../../global_core/helpers/helpers.dart';

class HotFoodsListView extends StatelessWidget {
  const HotFoodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          foods.length,
          (index) {
            // get individual restaurant
            Food food = Food.fromJson(foods[index]);
            return GestureDetector(
              onTap: () => context.navigateTo(
                BlocProvider<ClientCartCubit>(
                  create: (context) => ClientCartCubit(),
                  child: FoodDetails(food: food),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: widthOfTheScreen(context) * 0.75,
                  decoration: BoxDecoration(
                    color: kOffWhite,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      TheImageForFoods(food: food),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RowOfFoodDetails(
                              leftText: food.title.toString(),
                              rightText: '\$ ${food.price}'),
                          RowOfFoodDetails(
                              leftText: 'Delivery time : ',
                              rightText: food.time.toString()),
                          RowOfFoodDetails(
                              leftText: 'Rating : ',
                              rightText: '+${food.ratingCount}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
