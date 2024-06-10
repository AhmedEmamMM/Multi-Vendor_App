import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/client_home_cubit/client_home_cubit.dart';
import 'client_cart.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/hot_foods_list_view.dart';
import '../../../../global_core/helpers/helpers.dart';
import '../../../../global_core/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../../../../global_core/widgets/custom_container.dart';
import 'widgets/categories_list_view.dart';
import 'widgets/list_view_heading.dart';
import 'widgets/nearby_restaurant_list_view.dart';

class ClientHome extends StatelessWidget {
  const ClientHome({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return SafeArea(
      child: ListenableProvider<CartProvider>(
        create: (context) => CartProvider(),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(widthOfTheScreen(context), 90),
            child: CustomAppBar(
              address: cartProvider.deliveryAddress,
              cartItemsCount: cartProvider.getTotalItemCount(),
              onPressed: () => context.navigateTo(const ClientCart()),
            ),
          ),
          body: Consumer<CartProvider>(
            builder: (context, cartProvier, child) =>
                BlocBuilder<ClientHomeCubit, ClientHomeState>(
              builder: (context, state) {
                if (state is GetAllRestaurantsAndCategoriesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetAllRestaurantsAndCategoriesSuccess) {
                  return CustomContainer(
                    isThereAppBar: true,
                    customContainerContent: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ListViewHeading(text: 'Categories'),
                        6.verticalSpace,
                        CategoriesListView(allCategories: state.allCategories),
                        6.verticalSpace,
                        const ListViewHeading(text: 'Nearby Restaurant'),
                        6.verticalSpace,
                        NearbyRestaurantListView(
                            allRestaurants: state.allRestaurants),
                        6.verticalSpace,
                        const ListViewHeading(text: 'Hot Foods'),
                        6.verticalSpace,
                        const HotFoodsListView(),
                        6.verticalSpace,
                        const ListViewHeading(text: 'Recommended Restaurants'),
                        6.verticalSpace,
                        NearbyRestaurantListView(
                            allRestaurants: state.allRestaurants),
                        30.verticalSpace,
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
