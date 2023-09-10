import 'package:flutter/material.dart';

class CoustomTextField extends StatelessWidget {
  const CoustomTextField({
    super.key,
    required this.text,
   
    required this.hinttext,
    required this.icon,
    this.isObscure,
    required this.controller, 
  });
  final String text;
  final String hinttext;
  final Icon icon;
  final bool? isObscure;
 

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        SizedBox(
          width: 460,
          height: 45,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                suffixIcon: icon,
                hintText: hinttext,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            obscureText: isObscure! ? true : false,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
