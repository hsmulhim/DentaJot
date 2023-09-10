import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.onTap,
  });

  final Color buttonColor;
  final Color textColor;
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(30),
           ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}