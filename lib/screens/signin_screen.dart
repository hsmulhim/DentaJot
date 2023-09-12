import 'package:dental_proj/Utils/extensions.dart';
import 'package:dental_proj/components/custom_signin_container.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: Stack(
            children: [
              Container(
                width: context.getWidth,
                height: context.getHeight,
                color: const Color(0xff6fa2cd),
              ),
              const Positioned(top: 100, child: CustomSignInContainer())
            ],
          )),
    );
  }
}
