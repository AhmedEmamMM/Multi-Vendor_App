import 'package:flutter/material.dart';
import 'widgets/my_recipt.dart';
import '../../../../global_core/constants/constants.dart';
import '../../../../global_core/helpers/helpers.dart';

class DeliveryProgresPage extends StatelessWidget {
  const DeliveryProgresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Delivery in progress.."),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _builtBottomNavBar(context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MyReceipt(),
          ],
        ),
      ),
    );
  }

  // custin bottom nav Bar - massage / call delivery driver
  Widget _builtBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          color: kPrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          // profile picture
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                )),
          ),

          10.horizontalSpace,

          // driver details
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ahmed Emam",
                style: TextStyle(
                  color: kDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Driver",
                style: TextStyle(color: kDark),
              ),
            ],
          ),
          const Spacer(),

          Row(
            children: [
              // massafe button
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message,
                      color: Colors.blue,
                    )),
              ),
              10.horizontalSpace,

              // call button
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.call,
                      color: Colors.green,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
