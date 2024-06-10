import '../../global_core/widgets/loading_progress_indicator.dart';
import '../data/models/user.dart';
import '../imports/imports.dart';
import 'widgets/failaur_container.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  Widget goToClinetDashBoard(UserData userData) {
    return BlocProvider<ClientHomeCubit>(
        create: (context) =>
            ClientHomeCubit(ClientHomeRepo())..getRestaurantsAndCategoires(),
        child: ClientDashBoard(userData: userData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            context.read<AuthGateCubit>().getUserData();
            return BlocBuilder<AuthGateCubit, AuthGateState>(
              builder: (context, state) {
                if (state is GetUserDataLoadingState) {
                  // cercural progress indicator
                  return const LoadingProgressIndicator();
                  // check if the data is here or not yet
                } else if (state is GetUserDataSuccessState) {
                  return goToClinetDashBoard(state.userData);
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
