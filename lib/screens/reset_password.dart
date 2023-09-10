import 'package:dental_proj/components/custom_button.dart';
import 'package:dental_proj/components/custom_textfield.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/extensions/checks.dart';
import 'package:dental_proj/screens/otp_screen.dart';
import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final TextEditingController emailController = TextEditingController();

  Future<void> resetPassword() async {
    final email = emailController.text.trim();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OtpScreen(email: email),
      ),
    );
    if (email.isEmpty &&
                              !email.isValidEmail) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter Valid Email'),
        ),
      );
      return;
    }
else{    await Supabase.instance.client.auth.resetPasswordForEmail(email);
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Reset'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: const Column(
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  kVSpace16,
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Enter your email and we will send 6 digit code to your email",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            kVSpace16,
            CoustomTextField(
              hinttext: 'example@example.com',
              icon: const Icon(Icons.email_outlined),
              text: '',
              isObscure: false,
              controller: emailController,
            ),
            kVSpace64,
            CustomButton(
              buttonColor: Color(0xff2D4CB9),
              text: 'Reset Password',
              textColor: Colors.white,
              onTap: resetPassword,
            ),
          ],
        ),
      ),
    );
  }
}
