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
        title: Text('Appointment Details'),
      ),
      body: Column(
        children: [
          SizedBox(
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
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text("Complaint"),
                          Text(complaint),
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
                          Text("Result"),
                          Text(result),
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
                          Text("Hospital Name"),
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
