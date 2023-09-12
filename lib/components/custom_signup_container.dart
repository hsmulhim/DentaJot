import 'package:dental_proj/Utils/extensions.dart';
import 'package:dental_proj/components/custom_button.dart';
import 'package:dental_proj/components/custom_textfield.dart';
import 'package:dental_proj/extensions/navigation.dart';
import 'package:dental_proj/screens/first_screen.dart';
import 'package:dental_proj/screens/signin_screen.dart';
import 'package:dental_proj/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/extensions/checks.dart';
import 'package:dental_proj/models/patient_model.dart';

class CustomSignUpContainer extends StatefulWidget {
  const CustomSignUpContainer({super.key});

  @override
  State<CustomSignUpContainer> createState() => _CustomSignUpContainerState();
}

class _CustomSignUpContainerState extends State<CustomSignUpContainer> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  Future<void> _signUpFuture = Future.value();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight * 0.9,
      width: context.getWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kVSpace64,
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              kVSpace24,
              CoustomTextField(
                hinttext: 'Enter Name',
                icon: const Icon(Icons.person_2_outlined),
                text: 'Name',
                isObscure: false,
                controller: nameController,
              ),
              kVSpace24,
              CoustomTextField(
                hinttext: 'Enter Your Age',
                icon: const Icon(Icons.date_range),
                text: 'Age',
                isObscure: false,
                controller: ageController,
              ),
              kVSpace24,
              CoustomTextField(
                hinttext: 'Enter Email',
                icon: const Icon(Icons.email_outlined),
                text: 'Email',
                isObscure: false,
                controller: emailController,
              ),
              kVSpace24,
              CoustomTextField(
                hinttext: 'Password',
                icon: const Icon(Icons.remove_red_eye_outlined),
                text: 'Password',
                isObscure: true,
                controller: passwordController,
              ),
              kVSpace32,
              FutureBuilder<void>(
                future: _signUpFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    final error = snapshot.error.toString();
                    String errorMessage = 'An error occurred during sign-up';
                    if (error.contains('auth.users_email_key')) {
                      errorMessage = 'Invalid email address';
                    } else if (error
                        .contains('Password must be at least 6 characters')) {
                      errorMessage = 'Password must be at least 6 characters';
                    }

                    return Column(
                      children: [
                        Text(
                          errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                        kVSpace32,
                        CustomButton(
                          buttonColor: const Color(0xff6fa2cd),
                          text: 'Retry',
                          textColor: Colors.white,
                          onTap: () {
                            if ((emailController.text.isNotEmpty &&
                                    emailController.text.isValidEmail) &&
                                passwordController.text.isNotEmpty) {
                              setState(() {
                                _signUpFuture = _performSignUp();
                              });
                            }
                          },
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        CustomButton(
                          buttonColor: const Color(0xff6fa2cd),
                          text: 'Sign Up',
                          textColor: Colors.white,
                          onTap: () async {
                            if ((emailController.text.isNotEmpty &&
                                    emailController.text.isValidEmail) &&
                                passwordController.text.isNotEmpty) {
                              setState(() {
                                _signUpFuture = _performSignUp();
                              });
                            }
                          },
                        ),
                        kVSpace16,
                        InkWell(
                            onTap: () {
                              const SignInScreen().push(context);
                            },
                            child: const Text(
                              "Already have an account? Sign In",
                              style: TextStyle(color: Color(0xff2D4CB9)),
                            )),
                      ],
                    );
                  }
                },
              ),
              kVSpace24,
              Image.network(
                  'https://www12.0zz0.com/2023/09/06/20/848806498.png'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performSignUp() async {
    try {
      final user = await supabase.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
      );
      final userId = user.user?.id;

      if (userId != null) {
        await SupabaseService().addPatient(
          Patient(
            patientId: userId,
            patientName: nameController.text,
            ptientAge: int.parse(ageController.text),
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const FirstScreen()),
        );
      }
    } catch (error) {
      rethrow;
    }
  }
}
