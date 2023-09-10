import 'package:dental_proj/components/custom_button.dart';
import 'package:dental_proj/components/custom_textfield.dart';
import 'package:dental_proj/services/database_service.dart';
import 'package:flutter/material.dart';

import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/extensions/checks.dart';
import 'package:dental_proj/models/patient_model.dart';
import 'package:dental_proj/screens/profile_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 720,
      width: 375,
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
              CustomButton(
                buttonColor: Color(0xff2D4CB9),
                text: 'Sign Up',
                textColor: Colors.white,
                onTap: () async {
                  if ((emailController.text.isNotEmpty &&
                          emailController.text.isValidEmail) &&
                      passwordController.text.isNotEmpty) {
                    final user = await supabase.auth.signUp(
                      email: "fah22666a@gmail.com",
                      password: "dddddd999d99!@#",
                    );
                    final userId = user.user?.id;
                    print("------");
                    await SupabaseService().addPatient(
                      Patient(
                        patientId: userId,
                        patientName: "fahad",
                        ptientAge: 22,
                      ),
                    );
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => ProfileScreen()),
                    );
                  }
                },
              ),
              kVSpace64,
              Image.network(
                  'https://www12.0zz0.com/2023/09/06/20/848806498.png'),
            ],
          ),
        ),
      ),
    );
  }
}
