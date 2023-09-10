
import 'package:dental_proj/extensions/navigation.dart';
import 'package:dental_proj/screens/reset_password.dart';
import 'package:dental_proj/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
            onTap: () {
              const PasswordResetScreen().push(context);
            },
            child: const Text(
              "Forget Password?",
              style: TextStyle(color: Color(0xff2D4CB9)),
            )),
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Dont have an account?"),
          InkWell(
            onTap: () {
              const SignUpScreen().push(context);
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Color(0xff2D4CB9)),
            ),
          ),
        ],
      ),
    ]);
  }
}
