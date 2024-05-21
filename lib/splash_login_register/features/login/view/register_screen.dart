import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/core/constants/images.dart';
import 'package:four_apps_in_one_multi_user_app/core/widgets/my_button.dart';
import 'package:four_apps_in_one_multi_user_app/core/widgets/my_textfeild.dart';

class Register extends StatelessWidget {
  final void Function()? onTap;
  const Register({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final rePasswordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(registerBackgroundImg), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Create a New \n Account Now',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 75),
                  MyTextField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    hintText: 'password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    hintText: 'Re-password',
                    controller: rePasswordController,
                  ),
                  const SizedBox(height: 60),
                  MyButton(
                    text: 'Sign up',
                    backGroudcolor: Colors.white.withOpacity(0.6),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 50),
                  Container(
                      padding: const EdgeInsetsDirectional.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: GestureDetector(
                        onTap: onTap,
                        child: RichText(
                            text: const TextSpan(
                                text: 'Already have an account?  ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                  decorationThickness: 3,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ])),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
