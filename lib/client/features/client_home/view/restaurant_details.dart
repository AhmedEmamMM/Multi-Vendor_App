import 'package:flutter/material.dart';
import '../data/models/restauran_model.dart';
import '../../../../global_core/helpers/helpers.dart';

class RestaurantDetails extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetails({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${restaurant.title} Restaurant'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(restaurant.owner.toString()),
            15.verticalSpace,
            Text(restaurant.code.toString()),
            15.verticalSpace,
            Text(restaurant.coords!.coordsID.toString()),
            15.verticalSpace,
            Text(restaurant.coords!.address.toString()),
            15.verticalSpace,
            Text(restaurant.coords!.latitude.toString()),
            15.verticalSpace,
            Text(restaurant.coords!.latitudeDelta.toString()),
            15.verticalSpace,
            Text(restaurant.coords!.longitudeDelta.toString()),
            15.verticalSpace,
            Text(restaurant.coords!.title.toString()),
            15.verticalSpace,
            Text(restaurant.imageUrl.toString()),
            15.verticalSpace,
            Text(restaurant.logoUrl.toString()),
            15.verticalSpace,
            Text(restaurant.restaurantID.toString()),
            15.verticalSpace,
            Text(restaurant.time.toString()),
            15.verticalSpace,
            Text(restaurant.title.toString()),
            15.verticalSpace,
            Text(restaurant.categories![0].categoryID.toString()),
          ],
        ),
      ),
    );
  }
}
