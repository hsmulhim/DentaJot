import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();
Patient patientobj = Patient();

HomeAppBar() {
  if (box.hasData("patient")) {
    patientobj = Patient.fromJson(box.read("patient"));

    print("profile $patientobj");
  }
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: const Color(0xfff2fbfd),
    title: Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kVSpace32,
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              "https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg",
              height: 50,
              width: 50,
            ),
          ),
          kHSpace8,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ' Welcome ${patientobj.patientName} ' ?? "User",
              style: const TextStyle(
                  color: Color(0xff003253),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          kVSpace8,
        ],
      ),
    ),
  );
}
