import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/widgets/loading_progress_indicator.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/data/models/user.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/imports/imports.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/view/widgets/failaur_container.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthInstance = FirebaseAuth.instance;

    return Scaffold(
      body: StreamBuilder(
        stream: firebaseAuthInstance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            BlocProvider.of<AuthGateCubit>(context).getUserData();
            return BlocBuilder<AuthGateCubit, AuthGateState>(
              builder: (context, state) {
                if (state is GetUserDataLoadingState) {
                  // cercural progress indicator
                  return const LoadingProgressIndicator();
                  // check if the data is here or not yet
                } else if (state is GetUserDataSuccessState) {
                  // after getting the data of the current user we check the type of the user
                  // if the type of the user is client
                  if (state.userData.userType == "client") {
                    return goToClinetDashBoard(state.userData);
                    // if the type of the user is admin
                  } else if (state.userData.userType == "admin") {
                    return const Center(child: Text('admin'));
                    // if the type of the user is restaurant
                  } else if (state.userData.userType == "restaurant") {
                    return const Center(child: Text('restaurant'));
                    // if the type of the user is driver
                  } else if (state.userData.userType == "driver") {
                    return const Center(child: Text('driver'));
                  } else {
                    // if the type of the user is not all of the above
                    return const Center(child: Text('Unknown'));
                  }
                } else if (state is GetUserDataFaliuerState) {
                  // if there any error
                  return FaliaurContanier(message: state.message);
                } else {
                  return const SizedBox();
                }
              },
            );
          }
          // user is not logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}

Widget goToClinetDashBoard(UserData userData) {
  // final clientCubit = ClientCubit();
  final clientDashBoardCubit = ClientDashBoardCubit();
  // instance or Client Home Reposotrey
  final cHomeRepo = ClientHomeRepo();
  // instance or Client Home Cubit
  final cHomeCubit = ClientHomeCubit(cHomeRepo);
  return MultiBlocProvider(providers: [
    BlocProvider<ClientDashBoardCubit>(
        create: (context) => clientDashBoardCubit),
    BlocProvider<ClientHomeCubit>(
        create: (context) => cHomeCubit..getAllRestaurants()),
  ], child: ClientDashBoard(userData: userData));
}
