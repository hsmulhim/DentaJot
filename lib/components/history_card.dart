import 'package:flutter/material.dart';

import '../constants/spacings.dart';
import '../models/appointment_model.dart';

class AppointmentsCards extends StatelessWidget {
  const AppointmentsCards({
    super.key,
    required this.appointment,
  });
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(

        // ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[350],
              boxShadow: const [
                BoxShadow(color: Color(0xff6fa2cd), offset: Offset(-3, -3))
              ]),
          height: 100,
          width: 50,
          child: Row(
            children: [
              kHSpace8,
              Column(
                children: [
                  kVSpace32,
                  const Text("Hospital name",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(appointment.doctorName ?? ''),
                ],
              ),
              kHSpace16,
              Column(
                children: [
                  kVSpace32,
                  const Text("patientCases",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(appointment.patientCases ?? ''),
                ],
              ),
              kHSpace16,
              Column(
                children: [
                  kVSpace32,
                  const Text("Date",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(appointment.appointmentDate.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
