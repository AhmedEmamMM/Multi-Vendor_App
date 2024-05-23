import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'register_screen.dart';

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
