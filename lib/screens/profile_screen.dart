import 'dart:developer';

import 'package:dental_proj/components/custom_header.dart';
import 'package:dental_proj/components/custom_profile_ditails.dart';
import 'package:dental_proj/extensions/navigation.dart';
import 'package:dental_proj/models/patient_model.dart';
import 'package:dental_proj/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Patient patientobj = Patient();
    if (box.hasData("patient")) {
      patientobj = box.read("patient");
      print("profile $patientobj");
    }
    log(patientobj.patientName.toString());

    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xff2D4CB9),
            elevation: 0,
            leading: IconButton(
              iconSize: 15,
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await supabase.auth.signOut();
                if (context.mounted) {
                  context.pop;
                }
              },
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
            ]),
        body: SafeArea(
            top: false,
            bottom: false,
            child: Stack(children: [
              CustomPaint(
                painter: HeaderCurvedContainer(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Positioned(
                  top: 100,
                  left: 135,
                  child: Image.network(
                      'https://www3.0zz0.com/2023/09/08/10/230242090.png')),
              const Positioned(top: 220, left: 40, child: ProfileDetails()),
              Padding(
                  padding: const EdgeInsets.only(top: 350),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person_2_outlined),
                        title: Text('Name: ${patientobj.patientName}'),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: const Icon(Icons.calendar_month_outlined),
                        title: Text('Age:${patientobj.ptientAge}'),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.black87,
                      ),
                    ],
                  ))
            ])));
  }
}
