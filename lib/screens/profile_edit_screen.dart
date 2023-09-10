
import 'package:dental_proj/components/custom_edit_profile.dart';
import 'package:dental_proj/components/custom_header.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2D4CB9) ,
        elevation: 0,
      ),
        body: SafeArea(
            top: false,
            bottom: false,
            child: Stack(
             children: [
               CustomPaint(
                 painter: HeaderCurvedContainer() ,
                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height,
                 ),
               ),
               Positioned(
                 top:110,
                 left: 135,
                 child: Image.network('https://www3.0zz0.com/2023/09/08/10/230242090.png')),

                 const Positioned(
                  top: 190,
                  child:CustomEditProfile())
            ])

            ));
  }
}


