import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/constants/constants.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/data/models/user.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/imports/imports.dart';
import '../../../../../global_core/widgets/custom_container.dart';
import 'widgets/cover_proile_photos.dart';
import 'widgets/the_three_buttons.dart';

class ClientProfile extends StatelessWidget {
  final UserData userData;
  const ClientProfile({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomContainer(
        isThereAppBar: false,
        padding: EdgeInsets.zero,
        customContainerContent: Center(
          child: Column(
            children: [
              const CoverAndProfilePhotosStack(),
              const SizedBox(height: 5),
              Text(
                userData.name!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                  color: Colors.blue.shade900,
                ),
              ),
              Text(
                userData.email!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: kGray,
                ),
              ),
              Text(
                userData.uid!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: kGray,
                ),
              ),
              Text(
                userData.userType!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: kGray,
                ),
              ),
              const SizedBox(height: 15),
              TheThreeButtons(
                editOnTap: () {},
                myFavoriteOnTap: () {},
                exitOnTap: () {
                  BlocProvider.of<ClientDashBoardCubit>(context).isClosed;
                  if (FirebaseAuth.instance.currentUser != null) {
                    AuthService().signOut();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
