import 'package:canteen_daiict/core/common/sign_in_button.dart';
import 'package:canteen_daiict/core/constants/constants.dart';
import 'package:canteen_daiict/theme/pallete.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // backgroundColor: Pallete.redColor,
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            Constants.canteenLogoPath,
            height: 40,
          ),
        ),
        backgroundColor: Pallete.blackColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'Order food from your Fingertips!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Constants.loginEmotePath,
              height: 400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SignInButton(
            iconPath: Constants.googleLogoPath,
            signInWith: 'Google',
          ),
          SignInButton(
            iconPath: Constants.appleLogoPath,
            signInWith: 'Apple',
          ),
          SignInButton(
            iconPath: Constants.emailLogoPath2,
            signInWith: 'Email',
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: RichText(
                text: TextSpan(children: [
              const TextSpan(
                text: 'Already a user? ',
              ),
              TextSpan(
                text: 'Log In',
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: TextStyle(
                    color: Pallete.redColor, fontWeight: FontWeight.bold),
              )
            ])),
          ),
        ],
      ),
    );
  }
}
