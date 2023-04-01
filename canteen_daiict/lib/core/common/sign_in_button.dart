import 'package:canteen_daiict/core/constants/constants.dart';
import 'package:canteen_daiict/theme/pallete.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final String iconPath;
  final String signInWith;

  SignInButton({super.key, required this.iconPath, required this.signInWith});

  String get signInText => 'Continue with ' + signInWith;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 2, bottom: 2),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.greyColor,
            minimumSize: const Size(double.infinity, 40),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.ltr,
          children: [
            Image.asset(
              iconPath,
              width: 25,
            ),
            // const SizedBox(
            //   width: ,
            // ),
            Expanded(
              child: Text(
                signInText,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
                // textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
