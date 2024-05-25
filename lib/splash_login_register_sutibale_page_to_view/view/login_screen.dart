import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global_core/auth/auth_service.dart';
import '../../global_core/widgets/my_button.dart';
import '../../global_core/widgets/my_textfeild.dart';
import 'widgets/swap_login_register_pages.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;
  const Login({super.key, this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisable = false;
  bool isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signIn() async {
    setState(() {
      isLoading = true;
    });

    try {
      AuthService().signInWithEmailPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                children: [
                  SizedBox(height: 100.h),
                  Text(
                    'Welcome to\nour new 4-in-1 app',
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 75.h),
                  MyTextField(hintText: 'Email', controller: emailController),
                  SizedBox(height: 25.h),
                  MyTextField(
                    hintText: 'password',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 75.h),
                  MyButton(
                      backGroudcolor: Colors.white.withOpacity(0.7),
                      onPressed: () async {
                        await signIn();
                      },
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.black)
                          : const Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                  75.verticalSpace,
                  SwapBetweenLoginAndRegisterText(
                    text1: 'Don\'t have an Account?  ',
                    text2: 'Register Now',
                    onTap: widget.onTap,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
