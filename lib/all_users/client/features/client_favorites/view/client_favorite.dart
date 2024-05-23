import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/view/widgets/heading.dart';

import '../../../../../global_core/widgets/custom_container.dart';

class ClientFavorite extends StatelessWidget {
  const ClientFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClientFavorite'),
        centerTitle: true,
      ),
      body: const CustomContainer(
        isThereAppBar: true,
        customContainerContent: Center(
          child: Heading(text: 'ClientFavorite'),
        ),
      ),
    );
  }
}
