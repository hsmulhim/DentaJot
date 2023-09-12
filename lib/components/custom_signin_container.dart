import 'package:dental_proj/Utils/extensions.dart';
import 'package:dental_proj/components/custom_button.dart';
import 'package:dental_proj/components/custom_text.dart';
import 'package:dental_proj/components/custom_textfield.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/extensions/checks.dart';
import 'package:dental_proj/screens/first_screen.dart';
import 'package:dental_proj/services/database_service.dart';
import 'package:flutter/material.dart';

class CustomSignInContainer extends StatefulWidget {
  const CustomSignInContainer({Key? key});

  @override
  State<CustomSignInContainer> createState() => _CustomSignInContainerState();
}

class _CustomSignInContainerState extends State<CustomSignInContainer> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late Future<void> _signInFuture;

  @override
  void initState() {
    super.initState();
    _signInFuture = Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight,
      width: context.getWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            kVSpace64,
            const Text(
              "Sign In",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            kVSpace64,
            CoustomTextField(
              hinttext: 'Enter Email',
              icon: const Icon(Icons.email_outlined),
              text: 'Email',
              isObscure: false,
              controller: emailController,
            ),
            kVSpace24,
            CoustomTextField(
              hinttext: 'password',
              icon: const Icon(Icons.remove_red_eye_outlined),
              text: 'password',
              isObscure: true,
              controller: passwordController,
            ),
            kVSpace24,
            CustomTextWidget(),
            kVSpace32,
            // Use FutureBuilder to handle sign-in and display appropriate UI.
            FutureBuilder<void>(
              future: _signInFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a circular progress indicator while signing in.
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Handle the error case.
                  return Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  // Default state or success state.
                  return CustomButton(
                    buttonColor: Color(0xff2D4CB9),
                    text: 'Sign In',
                    textColor: Colors.white,
                    onTap: () async {
                      // Perform sign-in when the button is tapped.
                      if ((emailController.text.isNotEmpty &&
                              emailController.text.isValidEmail) &&
                          passwordController.text.isNotEmpty) {
                        setState(() {
                          _signInFuture = _performSignIn();
                        });
                      }
                    },
                  );
                }
              },
            ),
            kVSpace64,
            Image.network('https://www12.0zz0.com/2023/09/06/20/848806498.png'),
          ],
        ),
      ),
    );
  }

  Future<void> _performSignIn() async {
    try {
      await supabase.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const FirstScreen()),
          (route) => false,
        );
      }
    } catch (error) {
      // Handle other errors (e.g., log, show error message).
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Email does not exist or Password is wrong. Please try again.'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}
