import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register_sutibale_page_to_view/data/models/user.dart';

import '../../../../../global_core/auth/auth_service.dart';

class ClientHome extends StatelessWidget {
  final UserData userData;
  const ClientHome({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${userData.name}'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (FirebaseAuth.instance.currentUser != null) {
                  AuthService().signOut();
                }
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'UID :  ${userData.uid}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.blue,
                    ],
                  ).createShader(
                    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                  ),
              ),
            ),
            25.verticalSpace,
            Text(
              'Name :  ${userData.name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.blue,
                    ],
                  ).createShader(
                    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                  ),
              ),
            ),
            25.verticalSpace,
            Text(
              'Email :  ${userData.email}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.blue,
                    ],
                  ).createShader(
                    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                  ),
              ),
            ),
            25.verticalSpace,
            Text(
              'Password :  ${userData.password}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.blue,
                    ],
                  ).createShader(
                    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                  ),
              ),
            ),
            25.verticalSpace,
            Text(
              'Type :  ${userData.userType}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.blue,
                    ],
                  ).createShader(
                    const Rect.fromLTWH(0.0, 0.0, 350.0, 70.0),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
