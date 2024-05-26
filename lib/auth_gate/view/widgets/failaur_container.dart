import 'package:four_apps_in_one_multi_user_app/auth_gate/imports/imports.dart';

class FaliaurContanier extends StatelessWidget {
  final String message;
  const FaliaurContanier({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 2,
      height: size.height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('the error is $message')),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                minWidth: size.width * 0.4,
                child: const Text('Try again'),
                onPressed: () =>
                    BlocProvider.of<AuthGateCubit>(context).getUserData(),
              ),
              const SizedBox(height: 25),
              MyButton(
                minWidth: size.width * 0.4,
                child: const Text('Exit'),
                onPressed: () {
                  if (FirebaseAuth.instance.currentUser != null) {
                    AuthService().signOut();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
