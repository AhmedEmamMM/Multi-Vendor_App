import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register/features/login/view/login_screen.dart';
import 'package:four_apps_in_one_multi_user_app/splash_login_register/features/login/view/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool isLoginPage = true;
  void toggleBetweenLoginAndRegisterPage() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoginPage) {
      return Login(onTap: toggleBetweenLoginAndRegisterPage);
    } else {
      return Register(onTap: toggleBetweenLoginAndRegisterPage);
    }
  }
}
