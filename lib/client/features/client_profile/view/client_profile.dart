import 'package:four_apps_in_one_multi_user_app/client/features/client_profile/view/widgets/custom_list_tile.dart';
import '../../../../auth_gate/data/models/user.dart';
import '../../../../auth_gate/imports/imports.dart';
import '../../../../global_core/widgets/custom_container.dart';

class ClientProfile extends StatelessWidget {
  final UserData userData;
  const ClientProfile({super.key, required this.userData});

  AppBar myAppBar() {
    return AppBar(
      title: Text(
        userData.name!,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.exit_to_app_outlined,
                size: 35,
                color: Colors.red,
              )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: myAppBar(),
      body: CustomContainer(
        isThereAppBar: true,
        padding: EdgeInsets.zero,
        customContainerContent: Center(
          child: Column(
            children: [
              const SizedBox(height: 5),
              CustomListTile(
                name: "Account Info",
                onTap: () {},
                icon: Icons.person,
              ),
              CustomListTile(
                name: "My Purchase History",
                onTap: () {},
                icon: Icons.sticky_note_2_outlined,
              ),
              CustomListTile(
                name: "My Favorite",
                onTap: () {},
                icon: Icons.favorite,
              ),
              CustomListTile(
                name: "About us",
                onTap: () {},
                icon: Icons.info_outline,
              ),
              CustomListTile(
                name: "Settings",
                onTap: () {},
                icon: Icons.settings,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
