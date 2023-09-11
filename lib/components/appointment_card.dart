import 'package:dental_proj/Utils/extensions.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/screens/appointment_details_Screen.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.patientCases,
    required this.appointmentDate,
    required this.complaint,
    required this.result,
    required this.hospitalName,
  });

  final String doctorName;
  final String patientCases;
  final String appointmentDate;
  final String complaint;
  final String result;
  final String hospitalName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AppointmentDetailsScreen(
            doctorName: doctorName,
            patientCases: patientCases,
            appointmentDate: appointmentDate,
            complaint: complaint,
            result: result,
            hospitalName: hospitalName,
          ),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[350],
              boxShadow: const [
                BoxShadow(color: Color(0xff2D4CB9), offset: Offset(-3, -3))
              ]),
          height: 100,
          width: context.getWidth - 50,
          child: Row(
            children: [
              kHSpace8,
              Column(
                children: [
                  kVSpace32,
                  const Text("Doctor name",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(doctorName),
                ],
              ),
              kHSpace16,
              Column(
                children: [
                  kVSpace32,
                  const Text("patientCases",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(patientCases),
                ],
              ),
              kHSpace16,
              Column(
                children: [
                  kVSpace32,
                  const Text("Date",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(appointmentDate),
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                size: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
