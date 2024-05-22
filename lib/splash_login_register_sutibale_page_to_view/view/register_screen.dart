import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/auth/auth_service.dart';
import '../../global_core/widgets/my_button.dart';
import '../../global_core/widgets/my_textfeild.dart';
import 'widgets/heading.dart';
import 'widgets/swap_login_register_pages.dart';

class Register extends StatefulWidget {
  final void Function()? onTap;
  const Register({super.key, this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisable = false;
  bool isLoading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  void signUp() async {
    setState(() {
      isLoading = true;
    });

    try {
      if (passwordController.text == rePasswordController.text) {
        await AuthService().signUpWithEmailPassword(
            nameController.text, emailController.text, passwordController.text);
      } else {
        print('Passwords donst match');
      }
      // await getIt<AuthService>().signInWithEmailPassword(
      //     email: emailController.text, password: passwordController.text);
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height.h,
            width: MediaQuery.of(context).size.width.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  const Heading(text: 'Create a New \n Account Now'),
                  SizedBox(height: 50.h),
                  MyTextField(
                    hintText: 'Name',
                    controller: nameController,
                  ),
                  SizedBox(height: 25.h),
                  MyTextField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  SizedBox(height: 25.h),
                  MyTextField(
                    hintText: 'password',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 25.h),
                  MyTextField(
                    hintText: 'Re-password',
                    controller: rePasswordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 45.h),
                  MyButton(
                    backGroudcolor: Colors.white.withOpacity(0.6),
                    onPressed: signUp,
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.black,
                          )
                        : const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  SizedBox(height: 40.h),
                  SwapBetweenLoginAndRegisterText(
                    text1: 'Already have an account?  ',
                    text2: 'Login',
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
