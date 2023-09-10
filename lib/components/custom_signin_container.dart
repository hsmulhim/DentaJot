
import 'package:dental_proj/components/custom_button.dart';
import 'package:dental_proj/components/custom_text.dart';
import 'package:dental_proj/components/custom_textfield.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/extensions/checks.dart';
import 'package:dental_proj/screens/profile_screen.dart';
import 'package:dental_proj/services/database_service.dart';
import 'package:flutter/material.dart';


class CustomSignInContainer extends StatefulWidget {
  const CustomSignInContainer({super.key});

  @override
  State<CustomSignInContainer> createState() => _CustomSignInContainerState();
}

class _CustomSignInContainerState extends State<CustomSignInContainer> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
                      height: 720,
                      width: 375,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
                            kVSpace64,
                            const Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
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
                             CustomButton(
                              buttonColor: Color(0xff2D4CB9),
                              text: 'Sign In',
                              textColor: Colors.white,
                              onTap: ()async {                          
                               if ((emailController.text.isNotEmpty &&
                              emailController.text.isValidEmail) &&
                          passwordController.text.isNotEmpty) {
                        await supabase.auth.signInWithPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        if (context.mounted) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()),
                              (route) {
                            return false;
                          });
                        }
                      }
                                           },                      
                            ),
                            kVSpace64,
                            Image.network('https://www12.0zz0.com/2023/09/06/20/848806498.png')
                          ])));
  }
}