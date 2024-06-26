import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/all_users/client/features/client_home/view/widgets/custom_app_bar.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/helpers/helpers.dart';
import '../../../../../global_core/widgets/custom_container.dart';
import 'widgets/categories_list_view.dart';
import 'widgets/list_view_heading.dart';
import 'widgets/nearby_restaurant_list_view.dart';

class ClientHome extends StatelessWidget {
  const ClientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(widthOfTheScreen(context), 90),
            child: const CustomAppBar()),
        body: CustomContainer(
          isThereAppBar: true,
          customContainerContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListViewHeading(text: 'Categories'),
              6.verticalSpace,
              const CategoriesListView(),
              6.verticalSpace,
              const ListViewHeading(text: 'Nearby Restaurant'),
              6.verticalSpace,
              const NearbyRestaurantListView(),
              6.verticalSpace,
              const ListViewHeading(text: 'Hot Foods'),
              6.verticalSpace,
              const NearbyRestaurantListView(),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
