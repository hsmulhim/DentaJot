import 'dart:io';

import 'package:dental_proj/components/appointment_card.dart';
import 'package:dental_proj/components/custom_header.dart';
import 'package:dental_proj/extensions/navigation.dart';
import 'package:dental_proj/screens/add_appointment_screen.dart';

import 'package:dental_proj/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String teethCase = "Normal";
final userId = supabase.auth.currentUser!.id;

class AppointmentScreen extends StatefulWidget {
  final String teethName;
  final int teethNumber;
  final int toothId;

  const AppointmentScreen({
    Key? key,
    required this.teethName,
    required this.teethNumber,
    required this.toothId,
  }) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final TextEditingController controllerComplaint = TextEditingController();
  final TextEditingController controllerResult = TextEditingController();
  final TextEditingController controllerDoctorName = TextEditingController();
  final TextEditingController controllerHospitalName = TextEditingController();
  final TextEditingController controllerReport = TextEditingController();
  final TextEditingController controllerAttachments = TextEditingController();
  final TextEditingController controllerOther = TextEditingController();

  DateTime? selectedDate = DateTime.now();
  String selectedEnam = 'Normal';

  final List<String> enamOptions = [
    'Normal',
    'Dental Filling',
    'Missing Tooth',
    'Implant Tooth',
    'Root Canal'
  ];

  List Appointments = [];
  File? image;

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    final List response = await SupabaseService().getAppontment(widget.toothId);

    final filteredAppointments = response.where((appointment) {
      return appointment['toothId'] == widget.toothId &&
          appointment['patientId'] == userId;
    }).toList();

    setState(() {
      Appointments = filteredAppointments;
    });
  }

  Future<void> addToDatabase() async {
    //------------------------------
    if (image != null) {
      await Supabase.instance.client.storage
          .from("images")
          .upload(image!.path, image!);
      print("Image Upload done");
      final imagePath = Supabase.instance.client.storage
          .from("images")
          .getPublicUrl(image!.path);

      /*
          await Supabase.instance.client.from('Paitant').update({"$type":"imagePath"}).eq(....)
          */
    }
    //------------------------------

    final Map<String, dynamic> data = {
      'appointmentDate': selectedDate?.toString(),
      'complaint': controllerComplaint.text,
      'result': controllerResult.text,
      'doctorName': controllerDoctorName.text,
      'hospitalName': controllerHospitalName.text,
      'report': controllerReport.text,
      'attachments': controllerAttachments.text,
      'other': controllerOther.text,
      'patientCases': selectedEnam,
      'toothId': widget.toothId,
      'patientId': userId,
    };

    final response =
        await Supabase.instance.client.from('Appointment').upsert([data]);

    if (response.error != null) {
      print('errorr : ${response.error!.message}');
    } else {
      print('Added successfully');
      fetchAppointments();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6fa2cd),
        elevation: 0,
        title: Row(
          children: [
            Text('          ${widget.teethNumber}   ${widget.teethName}'),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            CustomPaint(
              painter: HeaderCurvedContainer(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Positioned(
              top: 20,
              left: 120,
              child: (() {
                switch (selectedEnam) {
                  case "Dental Filling":
                    return Center(
                      child: SizedBox(
                        height: 120,
                        width: 130,
                        child: Image.network(
                          'https://www4.0zz0.com/2023/09/11/13/923504282.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  case "Missing Tooth":
                    return Center(
                      child: SizedBox(
                        height: 120,
                        width: 130,
                        child: Image.network(
                          'https://www4.0zz0.com/2023/09/11/13/172399397.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  case "Root Canal":
                    return Center(
                      child: SizedBox(
                        height: 120,
                        width: 130,
                        child: Image.network(
                          'https://www4.0zz0.com/2023/09/11/13/398775736.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  case "Implant Tooth":
                    return Center(
                      child: SizedBox(
                        height: 120,
                        width: 130,
                        child: Image.network(
                          'https://www4.0zz0.com/2023/09/11/13/284957738.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  default:
                    return SizedBox(
                      height: 120,
                      width: 130,
                      child: Image.network(
                        'https://www11.0zz0.com/2023/09/10/12/528799999.png',
                        fit: BoxFit.fill,
                      ),
                    );
                }
              })(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180, left: 18),
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Appointments.length,
                  itemBuilder: (context, index) {
                    final Appointment = Appointments[index];
                    return AppointmentCard(
                      doctorName: Appointment['doctorName'],
                      patientCases: Appointment['patientCases'],
                      appointmentDate: Appointment['appointmentDate'],
                      complaint: Appointment['complaint'],
                      result: Appointment['result'],
                      hospitalName: Appointment['hospitalName'],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          AddAppointmentScreen(
            teethName: widget.teethName,
            teethNumber: widget.teethNumber,
            toothId: widget.toothId,
          ).push(context);
        },
      ),
    );
  }
}
