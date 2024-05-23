import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/constants/constants.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/helpers/helpers.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/logic/client_cubit/client_cubit.dart';
import '../../../../../global_core/auth/auth_service.dart';
import '../../../../../global_core/widgets/custom_container.dart';
import 'widgets/cover_proile_photos.dart';
import 'widgets/the_three_buttons.dart';

class ClientProfile extends StatelessWidget {
  const ClientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ClientCubit, ClientState>(
        builder: (context, state) {
          if (state is GetUserDataSuccess) {
            return Scaffold(
              body: CustomContainer(
                isThereAppBar: false,
                padding: EdgeInsets.zero,
                customContainerContent: Center(
                  child: Column(
                    children: [
                      const CoverAndProfilePhotosStack(),
                      5.verticalSpace,
                      Text(
                        state.userData.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      Text(
                        state.userData.email,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kGray,
                        ),
                      ),
                      Text(
                        state.userData.uid,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kGray,
                        ),
                      ),
                      Text(
                        state.userData.userType,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kGray,
                        ),
                      ),
                      15.verticalSpace,
                      TheThreeButtons(
                        editOnTap: () {},
                        myFavoriteOnTap: () {},
                        exitOnTap: () {
                          if (FirebaseAuth.instance.currentUser != null) {
                            AuthService().signOut();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text('No Data To show'));
          }
        },
      ),
    );
  }
}
