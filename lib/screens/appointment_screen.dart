import 'package:dental_proj/Widgets/appointment_card.dart';
import 'package:dental_proj/Widgets/text_field_widgets.dart';
import 'package:dental_proj/services/supabase.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class AppointmentScreen extends StatefulWidget {
  final String teethName;
  final int teethNumber;
  final int toothId;

  AppointmentScreen({
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
    'Tooth Decay',
    'Knocked tooth',
    'Filling out',
    'Implement tooth',
    'Tooth nerve',
  ];

  List Appointments = [];

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    final List response = await getAppontment(widget.toothId);

    setState(() {
      Appointments = response;
    });
  }

  Future<void> addToDatabase() async {
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
      'patientId': "2beb56e0-9914-469e-b6e5-69f3f6b6ae6f",
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
        title: Row(
          children: [
            Text('          ${widget.teethNumber}   ${widget.teethName}'),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Add(context);
        },
      ),
    );
  }

  Future<void> Add(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              DropdownButtonFormField<String>(
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
              SizedBox(
                height: 50,
              ),
              Text(
                "Date:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
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
                  "${selectedDate?.toLocal() ?? DateTime.now()}".split(' ')[0],
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFieldWidget(
                title: "Complaint",
                hint: "Complaint",
                controller: controllerComplaint,
              ),
              SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                title: "Result",
                hint: "Result",
                controller: controllerResult,
              ),
              SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                title: "Doctor Name",
                hint: "Doctor Name",
                controller: controllerDoctorName,
              ),
              SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                title: "Hospital Name",
                hint: "Hospital Name",
                controller: controllerHospitalName,
              ),
              SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                title: "Report",
                hint: "Report",
                controller: controllerReport,
              ),
              SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                title: "Attachments",
                hint: "Attachments",
                controller: controllerAttachments,
              ),
              SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                title: "Other",
                hint: "Other",
                controller: controllerOther,
              ),
              IconButton(
                onPressed: () {
                  addToDatabase();
                  Navigator.of(context).pop();

                  setState(() {
                    fetchAppointments();
                  });
                },
                icon: Icon(
                  Icons.save,
                  size: 40,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
