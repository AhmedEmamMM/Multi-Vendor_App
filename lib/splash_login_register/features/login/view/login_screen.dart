import 'package:flutter/material.dart';
import 'package:four_apps_in_one_multi_user_app/core/constants/images.dart';
import 'package:four_apps_in_one_multi_user_app/core/widgets/my_button.dart';
import 'package:four_apps_in_one_multi_user_app/core/widgets/my_textfeild.dart';

class Login extends StatelessWidget {
  final void Function()? onTap;
  const Login({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(loginBackgroundImg), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Welcome to\nour new 4-in-1 app',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 75),
                MyTextField(hintText: 'Email', controller: emailController),
                const SizedBox(height: 25),
                MyTextField(
                    hintText: 'password', controller: passwordController),
                const SizedBox(height: 75),
                MyButton(
                  text: 'Sign In',
                  backGroudcolor: Colors.white.withOpacity(0.6),
                  onPressed: () {},
                ),
                const SizedBox(height: 75),
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
                              text: 'Don\'t have an account?  ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              children: [
                            TextSpan(
                              text: 'Register Now',
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
    );
  }
}
