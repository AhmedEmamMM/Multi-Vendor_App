import 'package:flutter/material.dart';
import 'widgets/app_bar_text_field.dart';
import '../../../../global_core/widgets/custom_container.dart';

class ClientSearch extends StatefulWidget {
  const ClientSearch({super.key});

  @override
  State<ClientSearch> createState() => _ClientSearchState();
}

class _ClientSearchState extends State<ClientSearch> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: AppBarTextField(controller: searchController),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint(searchController.text);
              searchController.clear();
            },
            icon: const Icon(Icons.search, size: 35, color: Colors.black),
          ),
        ],
      ),
      body: const CustomContainer(
        isThereAppBar: true,
        customContainerContent: Column(
          children: [
            Center(
              child: Text('What wanna search for'),
            )
          ],
        ),
      ),
    );
  }
}
