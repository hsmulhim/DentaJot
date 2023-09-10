
import 'package:dental_proj/components/custom_button.dart';
import 'package:dental_proj/components/custom_textfield.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:flutter/material.dart';

class CustomEditProfile extends StatefulWidget {
  const CustomEditProfile({super.key});

  @override
  State<CustomEditProfile> createState() => _CustomEditProfileState();
}

class _CustomEditProfileState extends State<CustomEditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 720,
      width: 375,
      child: Padding(
               padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                kVSpace16,
                CoustomTextField(
                  hinttext: 'Enter Name',
                  icon: const Icon(Icons.person_2_outlined),
                  text: 'Name',
                  isObscure: false,
                  controller: nameController,
                ),
                kVSpace16,
                CoustomTextField(
                  hinttext: 'Enter Age',
                  icon: const Icon(Icons.calendar_month),
                  text: 'Age',
                  isObscure: false,
                  controller: ageController,
                ),
                kVSpace16,
                CoustomTextField(
                  hinttext: 'Gender',
                  icon: const Icon(Icons.female_outlined),
                  text: 'Gender',
                  isObscure: true,
                  controller: genderController,
                ),
                kVSpace32,
    
                const CustomButton(
                  buttonColor: Color(0xff2D4CB9),
                  text: 'Edit Profile',
                  textColor: Colors.white,
                ),
                kVSpace32,
                Image.network(
                    'https://www12.0zz0.com/2023/09/06/20/848806498.png')
              ])),
    );
  }
}
