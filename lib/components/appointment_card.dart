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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          color: Colors.grey[350],
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Icon(Icons.medical_information),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text("Doctor name"),
                  Text(doctorName),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text("patientCases"),
                  Text(patientCases),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text("Date"),
                  Text(appointmentDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
