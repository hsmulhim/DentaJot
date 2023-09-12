import 'package:dental_proj/components/custom_button.dart';
import 'package:dental_proj/components/text_field_widgets.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userId = supabase.auth.currentUser!.id;

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen(
      {super.key,
      required this.teethName,
      required this.teethNumber,
      required this.toothId});
  final String teethName;
  final int teethNumber;
  final int toothId;
  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  final TextEditingController controllerComplaint = TextEditingController();
  final TextEditingController controllerResult = TextEditingController();
  final TextEditingController controllerDoctorName = TextEditingController();
  final TextEditingController controllerHospitalName = TextEditingController();

  DateTime? selectedDate = DateTime.now();
  String selectedEnam = 'Normal';

  final List<String> enamOptions = [
    'Normal',
    'Dental Filling',
    'Missing Tooth',
    'Implant Tooth',
    'Root Canal'
  ];
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
    final Map<String, dynamic> data = {
      'appointmentDate': selectedDate?.toString(),
      'complaint': controllerComplaint.text,
      'result': controllerResult.text,
      'doctorName': controllerDoctorName.text,
      'hospitalName': controllerHospitalName.text,
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

  List Appointments = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          bottom: false,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: const Color(0xff6fa2cd),
              ),
              Positioned(
                  top: 100,
                  child: Container(
                    height: 740,
                    width: 390,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        kVSpace32,
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  )),
                              borderRadius: BorderRadius.circular(20),
                              value: selectedEnam,
                              onChanged: (value) {
                                setState(() {
                                  selectedEnam = value!;
                                });
                              },
                              items: enamOptions.map((String option) {
                                return DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        kVSpace16,
                        const Text(
                          "Date:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        kVSpace8,
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff6fa2cd),
                            ),
                          ),
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: selectedDate ?? DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null && picked != selectedDate) {
                              setState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                          child: Text(
                            "${selectedDate?.toLocal() ?? DateTime.now()}"
                                .split(' ')[0],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        kVSpace16,
                        TextFieldWidget(
                          title: "Doctor Name",
                          hint: "Doctor Name",
                          controller: controllerDoctorName,
                        ),
                        kVSpace16,
                        TextFieldWidget(
                          title: "Hospital Name",
                          hint: "Hospital Name",
                          controller: controllerHospitalName,
                        ),
                        kVSpace16,
                        TextFieldWidget(
                          title: "Complaint",
                          hint: "Complaint",
                          controller: controllerComplaint,
                        ),
                        kVSpace16,
                        TextFieldWidget(
                          title: "Result",
                          hint: "Result",
                          controller: controllerResult,
                        ),
                        kVSpace8,
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: CustomButton(
                            buttonColor: const Color(0xff6fa2cd),
                            textColor: Colors.white,
                            text: 'Add',
                            onTap: () {
                              addToDatabase();
                              Navigator.of(context).pop();

                              setState(() {
                                fetchAppointments();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
