import 'package:dental_proj/Functions/teeth_function.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TeethWidget extends StatelessWidget {
  const TeethWidget(
      {super.key,
      required this.topP,
      required this.liftP,
      required this.heightImg,
      required this.teethName,
      required this.teethNumber,
      required this.teethimg,
      required this.toothId});
  final double topP;
  final double liftP;
  final double heightImg;
  final int teethName;
  final int teethNumber;
  final String teethimg;
  final int toothId;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topP,
      left: liftP,
      height: heightImg,
      child: ZoomTapAnimation(
        begin: 1.0,
        child: InkWell(
          onTap: () async {
            teeth_function(context, teethName, teethNumber);
          },
          child: Image.asset(
            teethimg,
          ),
        ),
      ),
    );
  }
}
