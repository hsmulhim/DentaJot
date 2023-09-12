import 'package:flutter/material.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final String doctorName;
  final String patientCases;
  final String appointmentDate;
  final String complaint;
  final String result;
  final String hospitalName;

  const AppointmentDetailsScreen({
    Key? key,
    required this.doctorName,
    required this.patientCases,
    required this.appointmentDate,
    required this.complaint,
    required this.result,
    required this.hospitalName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6fa2cd),
        title: const Text('Appointment Details'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              color: Colors.grey[350],
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.medical_information),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text("Doctor name"),
                          Text(doctorName),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text("patientCases"),
                          Text(patientCases),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text("Date"),
                          Text(appointmentDate),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text("Complaint"),
                          Text(complaint),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text("Result"),
                          Text(result),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text("Hospital Name"),
                          Text(hospitalName),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
